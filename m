Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245437;
	b=qDOVSIZBiQZVal6CS0U0mtITkY03UfEqMmrIqlAMNh6ax2S5FnCs17JLV8ovNvVMlUTB
	 t+S+JVOJokS7Bvwd+8ClWVxEd+9xD4znS7tAJwLhE4IhUv903XGrPipf/OWGPNUAbFHUc
	 tIrMtlUomnjAEevFRRWYp/IieS57IfrlEeIIpb+gs3z+rTpKMl3f1iPPBZYghK+tM+wWg
	 MI753QpuAbym7xgU+O6xCh/xLNm34tWJ2FzPEBfok6keknsC+0tpxKekXzkNzflR0wDNO
	 ALQ/Yym8JmuEMuUvCHPuaJINllVi0v1S6NFY8eYTlDKrX+YIK55bHQV7I3nETIf6b1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=IYrYl4ZoitwuOrErYPb74jC37YmtutoFHOUpAkQZfng=;
	b=ZH6HRDF82ORlTYGMQk1G55jucX30JvIOJ1X3Mo+Td+wMiUc2DgE6grVZVPxJE4KnTtr/
	 yXXqw4jfVRBpPcSbOwUHWeJEzLqru+5wypoHG4iiiDMeKkWaVMlnFxobvnkqI+jc5rs77
	 Q5Veo+uwsHYYZ2Bv5S0VoAD9uY9IOUS2o2ukemFfC+hGLedPGoz/PH0BtVTHyR9CmYYqd
	 QOYbA2DLJJn7iQO5mIVO+YiLeCYNECgSo+zn4xXwPHjEKSiN8OVjTO6KhvqUs9fCyOwyN
	 CgB++2dNb6rik4sirnk81gkW4oi2678Y5c2s0H3FrUf6PWhGUxdmHMXQ1yP43CUAuew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WPxLbK7J;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6590606A337
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6590606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WPxLbK7J
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so1616865eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795245436; x=1795850236; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYrYl4ZoitwuOrErYPb74jC37YmtutoFHOUpAkQZfng=;
        b=WPxLbK7JsYV+ydwpNZJci40yh+my4rEUFfob2MH+YMq7UpFJIZM3CA9clHQ6KDtZI3
         zUmG3nNrnnHnCGqaPZmI8+drPvAiAUhHc6eqgaXY8wtzHLdcX3tqQHWMs/27Yttnj6HB
         d0P1wPJQLKeOZSh0U8UpZVTAOXqjSXJcL86qp/MSnrGcaXBVAalbKgBl7Eninv0259nX
         to0axvdVl5XR4dRjjOU4xZyvC+dC0DZbTo4ghv492Q8K3P+xfivqCXNMbb4trbfCMIEP
         exvaarlv5DRARr5Ip+/t4eDi/LP8EcGDAVnRDviIq2kUPR9Iu1O2o/XEcwH77pJ4VyLC
         ta+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245436; x=1795850236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYrYl4ZoitwuOrErYPb74jC37YmtutoFHOUpAkQZfng=;
        b=ZghD58ql3vAEgkRCafl3fUNXBlw8gdlu8z7SIysFNcQEuyV00zCRf7dSLKvWUIDoun
         phq8uHs+Sp2t+SX4igyz6sODy0rDkKg1Q+zxdnfQfKWddmqnMMyG8wblgT1V2ML0IE/3
         WEj7QUCb381sjesm0HdyOAvdxrpPAAIUq2bHDuUdEzoOh42RU5XBEl80/TPbmL/1uakt
         sKtOi83aSmCvygzDbRXG74ZebisSlC399pjSnhfIWa3CjCuVVvjKF8pdNGZ/9SyBDtz7
         /fXGd4q1/O7WLii/YZcVwMHdKhbsm/EtuoT+TI1wIZrDlgnec6j7Fu9366kcCqKmwu90
         2Llw==
X-Forwarded-Encrypted: i=1; AL+hErEw+IhGmp6/QhYCiDW9px232JrvIaiI/vAN0Vr/x7oqSASpQ0R3NIQh4tePwYv5CM8MpGjHVl+1ku08+Ro=@vger.kernel.org
X-Gm-Message-State: APuU4Z//F9LwfrBFUuLaprRtCtZmZwJA/NQU8c19kluPfE1jtAytfEg7
	P52TEJ5eqzAlerrNmCKE9H3swRKBiv2u3oD7u50RzscuA2TSsyJb6HLj+YmOoly7MNqF+VlKdra
	Is+Abbhsm1Q==
X-Received: from dyba9.prod.google.com ([2002:a05:693c:63c9:b0:385:b68b:304c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:280c:b0:1b5:6441:a323
 with SMTP id a92af1059eb24-1b56441a60fmr1027535c88.9.1795245435640; Fri, 20
 Nov 2026 23:17:15 -0800 (PST)
Date: Fri, 20 Nov 2026 23:16:43 -0800
In-Reply-To: <20261121071651.67118-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121071651.67118-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121071651.67118-3-irogers@google.com>
Subject: [PATCH v7 02/10] perf maps: Add tail fast-path check in first_ending_after()
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

User-space map insertions (from /proc/pid/maps synthesis, runtime
PERF_RECORD_MMAP2, and jitdump) and BPF ksymbol registrations all flow
through maps__fixup_overlap_and_insert() -> first_ending_after().
Currently first_ending_after() has a fast-path check for the first map
(maps_by_address[0]), but no fast-path check for the last map
(maps_by_address[high]). Because /proc/pid/maps entries are synthesized
in ascending address order, every synthesized mapping starts at or after
maps_by_address[high]'s end, yet currently executes the full O(log N)
binary search loop.

Add a tail check in first_ending_after() so non-overlapping ascending
insertions complete in O(1), and add a unit test in tools/perf/tests/maps.c
covering ascending tail insertions.

Using 'perf bench internals maps':

  Before:
    Average ascending insert + lookup: 63.370 usec (+- 0.476 usec)
  After (-6.9%):
    Average ascending insert + lookup: 58.970 usec (+- 0.609 usec)

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/maps.c | 46 +++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/maps.c  |  4 ++++
 2 files changed, 50 insertions(+)

diff --git a/tools/perf/tests/maps.c b/tools/perf/tests/maps.c
index ff6d25f9c043..3e8418ec6100 100644
--- a/tools/perf/tests/maps.c
+++ b/tools/perf/tests/maps.c
@@ -253,9 +253,55 @@ static int test__maps__fixup_overlap_and_insert(struct test_suite *t __maybe_unu
 	return TEST_OK;
 }
 
+static int test__maps__tail_insert(struct test_suite *t __maybe_unused,
+				   int subtest __maybe_unused)
+{
+	struct map_def ascending_maps[] = {
+		{ "map_c", 1000, 2000 },
+		{ "map_a", 2000, 3000 },
+		{ "map_d", 4000, 5000 },
+	};
+	struct map *map, *found;
+	struct perf_env host_env;
+	struct machine *machine;
+	struct maps *maps;
+	int ret;
+
+	perf_env__init(&host_env);
+	machine = machine__new_live(&host_env, /*kernel_maps=*/false, getpid());
+	maps = maps__new(machine);
+
+	TEST_ASSERT_VAL("failed to create machine", machine);
+	TEST_ASSERT_VAL("failed to create maps", maps);
+
+	/* Exercise tail fast-path in maps__fixup_overlap_and_insert. */
+	for (unsigned int i = 0; i < ARRAY_SIZE(ascending_maps); i++) {
+		map = dso__new_map(ascending_maps[i].name);
+		TEST_ASSERT_VAL("failed to create map", map);
+		map__set_start(map, ascending_maps[i].start);
+		map__set_end(map, ascending_maps[i].end);
+		TEST_ASSERT_VAL("failed to insert sorted map",
+				maps__fixup_overlap_and_insert(maps, map) == 0);
+		map__put(map);
+	}
+
+	ret = check_maps(ascending_maps, ARRAY_SIZE(ascending_maps), maps);
+	TEST_ASSERT_VAL("tail insert check_maps failed", !ret);
+
+	found = maps__find(maps, 2500);
+	TEST_ASSERT_VAL("failed to find map_a by address", found && map__start(found) == 2000);
+	map__zput(found);
+
+	maps__zput(maps);
+	machine__delete(machine);
+	perf_env__exit(&host_env);
+	return TEST_OK;
+}
+
 static struct test_case tests__maps[] = {
 	TEST_CASE("Test merge_in interface", maps__merge_in),
 	TEST_CASE("Test fix up overlap interface", maps__fixup_overlap_and_insert),
+	TEST_CASE("Test tail insert fast-path", maps__tail_insert),
 	{	.name = NULL, }
 };
 
diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 675fe0223faa..dd3b27b568da 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -858,6 +858,10 @@ static unsigned int first_ending_after(struct maps *maps, const struct map *map)
 	assert(maps__maps_by_address_sorted(maps));
 	if (low <= high && map__end(maps_by_address[0]) > map__start(map))
 		return 0;
+	if (low <= high && !RC_CHK_ACCESS(maps)->ends_broken &&
+	    map__end(maps_by_address[high]) <= map__start(map)) {
+		return first;
+	}
 
 	while (low <= high) {
 		int mid = (low + high) / 2;
-- 
2.56.1.750.gf70dc682cf-goog

