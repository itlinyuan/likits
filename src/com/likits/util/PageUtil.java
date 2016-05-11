package com.likits.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页
 */
public abstract class PageUtil {

    public static <T> Page<T> pager(int index, int total, int itemLimit, int pageLimit) {
        int halfPageLimit = pageLimit / 2;

        int pageCount = total / itemLimit;

        if (total % itemLimit != 0) {
            pageCount++;
        }

        if (index < 1 || index > pageCount) {
            index = 1;
        }

        int start, end;
        int skipCount = (index - 1) * itemLimit;

        if (pageCount <= pageLimit) {
            start = 1;
            end = pageCount;
        } else {
            start = index - halfPageLimit;
            if (start <= 0) {
                start = 1;
            }
            end = start + pageLimit - 1;
            if (end > pageCount) {
                end = pageCount;
                start = end - pageLimit + 1;
            }
        }
        return new Page<>(index, total, pageCount, start, end, skipCount, itemLimit);
    }

    public static class Page<T> {
        private int index;

        private int pageCount;

        private int totalCount;

        private int start;

        private int end;

        private int skip;

        private int limit;

        private List<T> result;

        public Page(int index, int totalCount, int pageCount, int start, int end, int skip, int limit) {
            this.index = index;
            this.totalCount = totalCount;
            this.pageCount = pageCount;
            this.start = start;
            this.end = end;
            this.skip = skip;
            this.limit = limit;
            result = new ArrayList<>();
        }

        public int getIndex() {
            return index;
        }

        public int getPageCount() {
            return pageCount;
        }

        public int getStart() {
            return start;
        }

        public int getEnd() {
            return end;
        }

        public int getSkip() {
            return skip;
        }

        public int getLimit() {
            return limit;
        }

        public List<T> getResult() {
            return result;
        }

        public void setResult(List<T> result) {
            this.result.clear();

            if (result != null && !result.isEmpty()) {
                this.result.addAll(result);
            }
        }

        public int getTotalCount() {
            return totalCount;
        }
    }
}
