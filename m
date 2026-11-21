Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244386;
	b=4kdnrOgm6xCITe+78A6qzWMFT/56gjqycu0kjSGnXMPW5HLHTWGeW1sEu9tzwo0jaIB4
	 LVdzligDR+uoz8cleLIUWkmOKF9erfJvMHcQPkXY+XJ23tcAB+hR9HMhbW3AvZ+mTRzc3
	 WPrD7mqSA3xdbD/b+1e9QDlReC+Pcguk32nXjEg7hujfaI01wi9atBwBSXlHY1kk6ah0y
	 38U7YTP/Az41kFnAIdS1r4tHRHMW7skq+FlTf96lKivGOVQDVsRR79ym7NP8XxXrinuR5
	 LF7GxXaWcINNJRI1K8RWgfmU+9UbQwvRC5XYQ3fDOtckG57YJqQPzD3AjY8bZOpRh+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KKCHmH2pVdOE54PhP32y0azMSK1f9AbECq6ur+8bzME=;
	b=CCVy90qoob9f4mykYtYGigff9Hz4N5o80CfqLAzXEa5+aLdp7T9PnqUZGMHYDHMdWGDI
	 HegVAKZnleY8kLX/T+94XYYwdjOLKpjEqG6Ca9m4TtDIDQj8757qWVgOb/cJt+ya+vSIr
	 gLFkM2f/H0OAbVOgp9dQwbaFET403FxYOajH1Hr6HZEDTzWpWX7C8fAjII+VZeLLxOPZy
	 tZ9TsxsZC3SI3ujiNSQrtBqP40JvUoeiGMqQCR2q53WzC09rAToha/cY4xtLu6j7rYivu
	 j1Xwu9uwZyf9tLbj6dO/cKJ3EssxJ2uThDbKa5gSFUSaN3YPZz9F7oYIABAGSBztDHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XcgLXmWJ;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40806606A334
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40806606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XcgLXmWJ
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e778acdbc6so2266447b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244384; x=1795849184; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKCHmH2pVdOE54PhP32y0azMSK1f9AbECq6ur+8bzME=;
        b=XcgLXmWJDKvYWVoiloPcxAbvl8qdOFIsYcrxnh+gIszGhvFm4QrBkYGZVzK4AL10wn
         eHaQAEvf0DbfEAHjvitubeUfL1W1Gfb1rcE2HUcIqbF7mq0XU4LG/yU5hy0UXfxcUCBT
         G9MyOlxC2J9EOPeegzJg36sAczzoJefTcestThBLgF7dvhyWME7L3qUYRASqpTcW3Az+
         vl1F/jbDddWaS2pm1xEoSqEAFB18OhpvxmTsqGXh1Bw5Mnhaq/gg8bs0TVwz0pQT/h+V
         MzaYX+LuIZHOEOUWwGrhgUd9TrB6tbIDf2THZcJ2Lkqb+f/oYvGUUgWrpqgVLNVmb6SX
         q49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244384; x=1795849184;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKCHmH2pVdOE54PhP32y0azMSK1f9AbECq6ur+8bzME=;
        b=d2yfxbQsmRGUA229FJ9iFqPgRnW8nzrtvHofJVGX8s/m6Y/93WJ4AwIQmraSELsbf0
         E2/KElxJrl+llN6C6KusIbA5LjgWJehmKSn+4stgnKdMSKLzBwSEVZJ6VJJ7ESRdDrtu
         rjDQTaY/LNUgm9dFvz7JLmMwJpz3qhPrdEvi2kluFdNVF8ou4oUR5T0V+DRy3e9xDm9T
         p8FbxuoMh/XtKu9OnuAI0cLR34FG5CxznVeoLULQnQqU84YBMwmBExPDWpSBxPFULZU7
         VZChWMQ2t9YGn72KkRrp2JlNg/lKiNLQ61xcsquhQQrgET20YgLG9UPQHkoZJrlXk3W/
         MUTA==
X-Forwarded-Encrypted: i=1; AL+hErFhzIqJXCSyvsKmZsdwGceIE76yheUj+qMkqifvGd9kw3lLBYkEI1kUweQMa/5GTvPytnI4i3F6QEIbjc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OAx8DTPgNuiU1QDhCl5ohPeWKXXQ4BLCbND+fqvQq/fw7ttvS
	as+uGTHkJbRsWLjLd88/IjACsajpLHyH4WlCCSeu9oOThgT753BmDVtq8AvMtssrFBQjgTnascq
	WEUwDKjO7Ag==
X-Received: from oigo23.prod.google.com ([2002:a05:6808:8897:b0:55e:c7d9:a271])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:50ab:b0:4ef:2584:78a3
 with SMTP id 5614622812f47-57a0c09be08mr6670317b6e.52.1795244383777; Fri, 20
 Nov 2026 22:59:43 -0800 (PST)
Date: Fri, 20 Nov 2026 22:58:10 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-22-irogers@google.com>
Subject: [PATCH v15 21/23] perf maps: Add context analysis annotations
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add __returns_ctx_lock() to maps__lock(), annotate DECLARE_RC_STRUCT(maps)
members protected by lock with __guarded_by(&lock), and annotate
internal maps helpers with __must_hold() and __must_hold_shared().

Signed-off-by: Ian Rogers <irogers@google.com>

# Conflicts:
#	tools/perf/util/maps.c
---
 tools/perf/util/maps.c | 117 ++++++++++++++++++++++++++---------------
 1 file changed, 76 insertions(+), 41 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 2279d8e3edc0..672c0ace5a00 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -31,12 +31,12 @@ DECLARE_RC_STRUCT(maps) {
 	 * @maps_by_address: array of maps sorted by their starting address if
 	 * maps_by_address_sorted is true.
 	 */
-	struct map	 **maps_by_address;
+	struct map	 **maps_by_address __guarded_by(&lock);
 	/**
 	 * @maps_by_name: optional array of maps sorted by their dso name if
 	 * maps_by_name_sorted is true.
 	 */
-	struct map	 **maps_by_name;
+	struct map	 **maps_by_name __guarded_by(&lock);
 	struct machine	 *machine;
 #ifdef HAVE_LIBUNWIND_SUPPORT
 	void		*addr_space;
@@ -51,26 +51,33 @@ DECLARE_RC_STRUCT(maps) {
 	 * @nr_maps: number of maps_by_address, and possibly maps_by_name,
 	 * entries that contain maps.
 	 */
-	unsigned int	 nr_maps;
+	unsigned int	 nr_maps __guarded_by(&lock);
 	/**
 	 * @nr_maps_allocated: number of entries in maps_by_address and possibly
 	 * maps_by_name.
 	 */
-	unsigned int	 nr_maps_allocated;
+	unsigned int	 nr_maps_allocated __guarded_by(&lock);
 	/**
 	 * @last_search_by_name_idx: cache of last found by name entry's index
 	 * as frequent searches for the same dso name are common.
 	 */
 	unsigned int	 last_search_by_name_idx;
 	/** @maps_by_address_sorted: is maps_by_address sorted. */
-	bool		 maps_by_address_sorted;
+	bool		 maps_by_address_sorted __guarded_by(&lock);
 	/** @maps_by_name_sorted: is maps_by_name sorted. */
-	bool		 maps_by_name_sorted;
+	bool		 maps_by_name_sorted __guarded_by(&lock);
 	/** @ends_broken: does the map contain a map where end values are unset/unsorted? */
-	bool		 ends_broken;
+	bool		 ends_broken __guarded_by(&lock);
 };
 
+static struct rw_semaphore *maps__lock(const struct maps *maps)
+	__returns_ctx_lock(&RC_CHK_ACCESS(maps)->lock)
+{
+	return (struct rw_semaphore *)&RC_CHK_ACCESS(maps)->lock;
+}
+
 static void check_invariants(const struct maps *maps __maybe_unused)
+	__must_hold_shared(maps__lock(maps))
 {
 #ifndef NDEBUG
 	assert(RC_CHK_ACCESS(maps)->nr_maps <= RC_CHK_ACCESS(maps)->nr_maps_allocated);
@@ -120,55 +127,65 @@ static void check_invariants(const struct maps *maps __maybe_unused)
 }
 
 static struct map **maps__maps_by_address(const struct maps *maps)
+	__must_hold_shared(maps__lock(maps))
 {
 	return RC_CHK_ACCESS(maps)->maps_by_address;
 }
 
 static void maps__set_maps_by_address(struct maps *maps, struct map **new)
+	__must_hold(maps__lock(maps))
 {
 	RC_CHK_ACCESS(maps)->maps_by_address = new;
 
 }
 
 static void maps__set_nr_maps_allocated(struct maps *maps, unsigned int nr_maps_allocated)
+	__must_hold(maps__lock(maps))
 {
 	RC_CHK_ACCESS(maps)->nr_maps_allocated = nr_maps_allocated;
 }
 
 static void maps__set_nr_maps(struct maps *maps, unsigned int nr_maps)
+	__must_hold(maps__lock(maps))
 {
 	RC_CHK_ACCESS(maps)->nr_maps = nr_maps;
 }
 
 /* Not in the header, to aid reference counting. */
 static struct map **maps__maps_by_name(const struct maps *maps)
+	__must_hold_shared(maps__lock(maps))
 {
 	return RC_CHK_ACCESS(maps)->maps_by_name;
 
 }
 
 static void maps__set_maps_by_name(struct maps *maps, struct map **new)
+	__must_hold(maps__lock(maps))
 {
 	RC_CHK_ACCESS(maps)->maps_by_name = new;
 
 }
 
 static bool maps__maps_by_address_sorted(const struct maps *maps)
+	__must_hold_shared(maps__lock(maps))
 {
 	return RC_CHK_ACCESS(maps)->maps_by_address_sorted;
 }
 
 static void maps__set_maps_by_address_sorted(struct maps *maps, bool value)
+	__must_hold(maps__lock(maps))
 {
 	RC_CHK_ACCESS(maps)->maps_by_address_sorted = value;
 }
 
 static bool maps__maps_by_name_sorted(const struct maps *maps)
+	__must_hold_shared(maps__lock(maps))
 {
 	return RC_CHK_ACCESS(maps)->maps_by_name_sorted;
 }
 
 static void maps__set_maps_by_name_sorted(struct maps *maps, bool value)
+	__must_hold(maps__lock(maps))
 {
 	RC_CHK_ACCESS(maps)->maps_by_name_sorted = value;
 }
@@ -178,11 +195,22 @@ struct machine *maps__machine(const struct maps *maps)
 	return RC_CHK_ACCESS(maps)->machine;
 }
 
-unsigned int maps__nr_maps(const struct maps *maps)
+static unsigned int __maps__nr_maps(const struct maps *maps)
+	__must_hold_shared(maps__lock(maps))
 {
 	return RC_CHK_ACCESS(maps)->nr_maps;
 }
 
+unsigned int maps__nr_maps(const struct maps *maps)
+{
+	unsigned int nr;
+
+	down_read(maps__lock(maps));
+	nr = __maps__nr_maps(maps);
+	up_read(maps__lock(maps));
+	return nr;
+}
+
 refcount_t *maps__refcnt(struct maps *maps)
 {
 	return &RC_CHK_ACCESS(maps)->refcnt;
@@ -221,12 +249,8 @@ void maps__set_libdw_addr_space_dwfl(struct maps *maps, void *dwfl)
 }
 #endif
 
-static struct rw_semaphore *maps__lock(struct maps *maps)
-{
-	return &RC_CHK_ACCESS(maps)->lock;
-}
-
 static void maps__init(struct maps *maps, struct machine *machine)
+	__context_unsafe(/* initialization */)
 {
 	init_rwsem(maps__lock(maps));
 	RC_CHK_ACCESS(maps)->maps_by_address = NULL;
@@ -248,11 +272,12 @@ static void maps__init(struct maps *maps, struct machine *machine)
 }
 
 static void maps__exit(struct maps *maps)
+	__context_unsafe(/* teardown */)
 {
 	struct map **maps_by_address = maps__maps_by_address(maps);
 	struct map **maps_by_name = maps__maps_by_name(maps);
 
-	for (unsigned int i = 0; i < maps__nr_maps(maps); i++) {
+	for (unsigned int i = 0; i < __maps__nr_maps(maps); i++) {
 		map__zput(maps_by_address[i]);
 		if (maps_by_name)
 			map__zput(maps_by_name[i]);
@@ -301,6 +326,7 @@ void maps__put(struct maps *maps)
 }
 
 static void __maps__free_maps_by_name(struct maps *maps)
+	__must_hold(maps__lock(maps))
 {
 	if (!maps__maps_by_name(maps))
 		return;
@@ -308,7 +334,7 @@ static void __maps__free_maps_by_name(struct maps *maps)
 	/*
 	 * Free everything to try to do it from the rbtree in the next search
 	 */
-	for (unsigned int i = 0; i < maps__nr_maps(maps); i++)
+	for (unsigned int i = 0; i < __maps__nr_maps(maps); i++)
 		map__put(maps__maps_by_name(maps)[i]);
 
 	zfree(&RC_CHK_ACCESS(maps)->maps_by_name);
@@ -341,12 +367,13 @@ static int map__start_cmp(const void *a, const void *b)
 }
 
 static void __maps__sort_by_address(struct maps *maps)
+	__must_hold(maps__lock(maps))
 {
 	if (maps__maps_by_address_sorted(maps))
 		return;
 
 	qsort(maps__maps_by_address(maps),
-		maps__nr_maps(maps),
+		__maps__nr_maps(maps),
 		sizeof(struct map *),
 		map__start_cmp);
 	maps__set_maps_by_address_sorted(maps, true);
@@ -389,7 +416,7 @@ static int maps__sort_by_name(struct maps *maps)
 				err = -ENOMEM;
 			else {
 				struct map **maps_by_address = maps__maps_by_address(maps);
-				unsigned int n = maps__nr_maps(maps);
+				unsigned int n = __maps__nr_maps(maps);
 
 				maps__set_maps_by_name(maps, maps_by_name);
 				for (unsigned int i = 0; i < n; i++)
@@ -398,7 +425,7 @@ static int maps__sort_by_name(struct maps *maps)
 		}
 		if (!err) {
 			qsort(maps_by_name,
-				maps__nr_maps(maps),
+				__maps__nr_maps(maps),
 				sizeof(struct map *),
 				map__strcmp);
 			maps__set_maps_by_name_sorted(maps, true);
@@ -410,9 +437,10 @@ static int maps__sort_by_name(struct maps *maps)
 }
 
 static unsigned int maps__by_address_index(const struct maps *maps, const struct map *map)
+	__must_hold_shared(maps__lock(maps))
 {
 	struct map **maps_by_address = maps__maps_by_address(maps);
-	unsigned int nr_maps = maps__nr_maps(maps);
+	unsigned int nr_maps = __maps__nr_maps(maps);
 
 	if (nr_maps && maps__maps_by_address_sorted(maps)) {
 		struct map **mapp =
@@ -431,9 +459,10 @@ static unsigned int maps__by_address_index(const struct maps *maps, const struct
 }
 
 static unsigned int maps__by_name_index(const struct maps *maps, const struct map *map)
+	__must_hold_shared(maps__lock(maps))
 {
 	struct map **maps_by_name = maps__maps_by_name(maps);
-	unsigned int nr_maps = maps__nr_maps(maps);
+	unsigned int nr_maps = __maps__nr_maps(maps);
 
 	if (!maps_by_name)
 		return -1;
@@ -474,10 +503,11 @@ static void map__set_kmap_maps(struct map *map, struct maps *maps)
 }
 
 static int __maps__insert(struct maps *maps, struct map *new)
+	__must_hold(maps__lock(maps))
 {
 	struct map **maps_by_address = maps__maps_by_address(maps);
 	struct map **maps_by_name = maps__maps_by_name(maps);
-	unsigned int nr_maps = maps__nr_maps(maps);
+	unsigned int nr_maps = __maps__nr_maps(maps);
 	unsigned int nr_allocate = RC_CHK_ACCESS(maps)->nr_maps_allocated;
 
 	if (nr_maps + 1 > nr_allocate) {
@@ -545,10 +575,11 @@ int maps__insert(struct maps *maps, struct map *map)
 }
 
 static void __maps__remove_at(struct maps *maps, unsigned int address_idx)
+	__must_hold(maps__lock(maps))
 {
 	struct map **maps_by_address = maps__maps_by_address(maps);
 	struct map **maps_by_name = maps__maps_by_name(maps);
-	unsigned int nr_maps = maps__nr_maps(maps);
+	unsigned int nr_maps = __maps__nr_maps(maps);
 	struct map *map;
 
 	if (address_idx >= nr_maps)
@@ -578,6 +609,7 @@ static void __maps__remove_at(struct maps *maps, unsigned int address_idx)
 }
 
 static void __maps__remove(struct maps *maps, struct map *map)
+	__must_hold(maps__lock(maps))
 {
 	__maps__remove_at(maps, maps__by_address_index(maps, map));
 }
@@ -640,7 +672,7 @@ bool maps__empty(struct maps *maps)
 	bool res;
 
 	down_read(maps__lock(maps));
-	res = maps__nr_maps(maps) == 0;
+	res = __maps__nr_maps(maps) == 0;
 	up_read(maps__lock(maps));
 
 	return res;
@@ -668,7 +700,7 @@ int maps__for_each_map(struct maps *maps, int (*cb)(struct map *map, void *data)
 			 * the array - this may cause maps to be skipped or
 			 * repeated.
 			 */
-			for (unsigned int i = 0; i < maps__nr_maps(maps); i++) {
+			for (unsigned int i = 0; i < __maps__nr_maps(maps); i++) {
 				struct map **maps_by_address = maps__maps_by_address(maps);
 				struct map *map = maps_by_address[i];
 
@@ -695,7 +727,7 @@ int maps__load_maps(struct maps *maps)
 		return 0;
 
 	down_read(maps__lock(maps));
-	nr_maps = maps__nr_maps(maps);
+	nr_maps = __maps__nr_maps(maps);
 	if (nr_maps == 0) {
 		up_read(maps__lock(maps));
 		return 0;
@@ -728,7 +760,7 @@ void maps__remove_maps(struct maps *maps, bool (*cb)(struct map *map, void *data
 	down_write(maps__lock(maps));
 
 	maps_by_address = maps__maps_by_address(maps);
-	for (unsigned int i = 0; i < maps__nr_maps(maps);) {
+	for (unsigned int i = 0; i < __maps__nr_maps(maps);) {
 		if (cb(maps_by_address[i], data)) {
 			__maps__remove_at(maps, i);
 			removed = true;
@@ -782,7 +814,7 @@ struct symbol *maps__find_symbol_by_name(struct maps *maps, const char *name, st
 	 * This prevents deadlocking if iteration triggers further map insertions.
 	 */
 	down_read(maps__lock(maps));
-	nr_maps = maps__nr_maps(maps);
+	nr_maps = __maps__nr_maps(maps);
 	maps_copy = calloc(nr_maps, sizeof(*maps_copy));
 	if (maps_copy) {
 		for (unsigned int i = 0; i < nr_maps; i++) {
@@ -867,9 +899,10 @@ size_t maps__fprintf(struct maps *maps, FILE *fp)
  * Same as find_vma() in kernel.
  */
 static unsigned int first_ending_after(struct maps *maps, const struct map *map)
+	__must_hold_shared(maps__lock(maps))
 {
 	struct map **maps_by_address = maps__maps_by_address(maps);
-	int low = 0, high = (int)maps__nr_maps(maps) - 1, first = high + 1;
+	int low = 0, high = (int)__maps__nr_maps(maps) - 1, first = high + 1;
 
 	assert(maps__maps_by_address_sorted(maps));
 	if (low <= high && map__end(maps_by_address[0]) > map__start(map))
@@ -894,10 +927,11 @@ static unsigned int first_ending_after(struct maps *maps, const struct map *map)
 
 static int __maps__insert_sorted(struct maps *maps, unsigned int first_after_index,
 				 struct map *new1, struct map *new2)
+	__must_hold(maps__lock(maps))
 {
 	struct map **maps_by_address = maps__maps_by_address(maps);
 	struct map **maps_by_name = maps__maps_by_name(maps);
-	unsigned int nr_maps = maps__nr_maps(maps);
+	unsigned int nr_maps = __maps__nr_maps(maps);
 	unsigned int nr_allocate = RC_CHK_ACCESS(maps)->nr_maps_allocated;
 	unsigned int to_add = new2 ? 2 : 1;
 
@@ -954,6 +988,7 @@ static int __maps__insert_sorted(struct maps *maps, unsigned int first_after_ind
  * adjusted or removed so that new fits without overlapping any entries.
  */
 static int __maps__fixup_overlap_and_insert(struct maps *maps, struct map *new)
+	__must_hold(maps__lock(maps))
 {
 	int err = 0;
 	unsigned int i, ni = INT_MAX; // Some gcc complain, but depends on maps_by_name...
@@ -965,7 +1000,7 @@ static int __maps__fixup_overlap_and_insert(struct maps *maps, struct map *new)
 	 * Iterate through entries where the end of the existing entry is
 	 * greater-than the new map's start.
 	 */
-	for (i = first_ending_after(maps, new); i < maps__nr_maps(maps); ) {
+	for (i = first_ending_after(maps, new); i < __maps__nr_maps(maps); ) {
 		struct map **maps_by_address = maps__maps_by_address(maps);
 		struct map **maps_by_name = maps__maps_by_name(maps);
 		struct map *pos = maps_by_address[i];
@@ -1076,7 +1111,7 @@ static int __maps__fixup_overlap_and_insert(struct maps *maps, struct map *new)
 			return err;
 		} else {
 			struct map *next = NULL;
-			unsigned int nr_maps = maps__nr_maps(maps);
+			unsigned int nr_maps = __maps__nr_maps(maps);
 
 			if (i + 1 < nr_maps)
 				next = maps_by_address[i + 1];
@@ -1160,8 +1195,8 @@ int maps__copy_from(struct maps *dest, struct maps *parent)
 	}
 #endif
 	parent_maps_by_address = maps__maps_by_address(parent);
-	n = maps__nr_maps(parent);
-	if (maps__nr_maps(dest) == 0) {
+	n = __maps__nr_maps(parent);
+	if (__maps__nr_maps(dest) == 0) {
 		/* No existing mappings so just copy from parent to avoid reallocs in insert. */
 		unsigned int nr_maps_allocated = RC_CHK_ACCESS(parent)->nr_maps_allocated;
 		struct map **dest_maps_by_address =
@@ -1245,7 +1280,7 @@ struct map *maps__find(struct maps *maps, u64 ip)
 		if (maps__maps_by_address_sorted(maps)) {
 			struct map **mapp = NULL;
 			struct map **maps_by_address = maps__maps_by_address(maps);
-			unsigned int nr_maps = maps__nr_maps(maps);
+			unsigned int nr_maps = __maps__nr_maps(maps);
 
 			if (maps_by_address && nr_maps)
 				mapp = bsearch(&ip, maps_by_address, nr_maps, sizeof(*mapp),
@@ -1281,7 +1316,7 @@ struct map *maps__find_by_name(struct maps *maps, const char *name)
 
 		/* First check last found entry. */
 		i = RC_CHK_ACCESS(maps)->last_search_by_name_idx;
-		if (i < maps__nr_maps(maps) && maps__maps_by_name(maps)) {
+		if (i < __maps__nr_maps(maps) && maps__maps_by_name(maps)) {
 			struct dso *dso = map__dso(maps__maps_by_name(maps)[i]);
 
 			if (dso && strcmp(dso__short_name(dso), name) == 0) {
@@ -1293,7 +1328,7 @@ struct map *maps__find_by_name(struct maps *maps, const char *name)
 		/* Second search sorted array. */
 		if (!done && maps__maps_by_name_sorted(maps)) {
 			struct map **mapp =
-				bsearch(name, maps__maps_by_name(maps), maps__nr_maps(maps),
+				bsearch(name, maps__maps_by_name(maps), __maps__nr_maps(maps),
 					sizeof(*mapp), map__strcmp_name);
 
 			if (mapp) {
@@ -1316,7 +1351,7 @@ struct map *maps__find_by_name(struct maps *maps, const char *name)
 
 				down_read(maps__lock(maps));
 				maps_by_address =  maps__maps_by_address(maps);
-				n = maps__nr_maps(maps);
+				n = __maps__nr_maps(maps);
 				for (i = 0; i < n; i++) {
 					struct map *pos = maps_by_address[i];
 					struct dso *dso = map__dso(pos);
@@ -1346,7 +1381,7 @@ struct map *maps__find_next_entry(struct maps *maps, struct map *map)
 		down_read(maps__lock(maps));
 	}
 	i = maps__by_address_index(maps, map);
-	nr_maps = maps__nr_maps(maps);
+	nr_maps = __maps__nr_maps(maps);
 	if (i < nr_maps && ++i < nr_maps)
 		result = map__get(maps__maps_by_address(maps)[i]);
 
@@ -1365,7 +1400,7 @@ void maps__fixup_end(struct maps *maps)
 		__maps__sort_by_address(maps);
 
 	maps_by_address = maps__maps_by_address(maps);
-	n = maps__nr_maps(maps);
+	n = __maps__nr_maps(maps);
 	for (unsigned int i = 1; i < n; i++) {
 		struct map *prev = maps_by_address[i - 1];
 		struct map *curr = maps_by_address[i];
@@ -1423,7 +1458,7 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 	first_after_ = first_ending_after(kmaps, new_map);
 	kmaps_maps_by_address = maps__maps_by_address(kmaps);
 
-	if (first_after_ >= maps__nr_maps(kmaps) ||
+	if (first_after_ >= __maps__nr_maps(kmaps) ||
 	    map__start(kmaps_maps_by_address[first_after_]) >= map__end(new_map)) {
 		/* No overlap so regular insert suffices. */
 		up_read(maps__lock(kmaps));
@@ -1438,7 +1473,7 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
 	first_after_ = first_ending_after(kmaps, new_map);
 	kmaps_maps_by_address = maps__maps_by_address(kmaps);
-	kmaps__nr_maps = maps__nr_maps(kmaps);
+	kmaps__nr_maps = __maps__nr_maps(kmaps);
 
 	if (first_after_ >= kmaps__nr_maps ||
 	    map__start(kmaps_maps_by_address[first_after_]) >= map__end(new_map)) {
-- 
2.56.1.750.gf70dc682cf-goog

