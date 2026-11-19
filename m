Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113576;
	b=NMD/iYfN+5Jo/0NYjU4unaGqUrLZQsB6+siqUdjfB1EObe37CKP5ZZv7ptEXoPxE4hU3
	 AF2n+N0RkcKPaJPVYj6rUrO9fLriN6Ha1Kb1JpkeZQa6p+LsvTsJkyiKT5Fl2S62ofEAz
	 BM010bHt6BHMj1RkiRPp4iPSw4e3dLzL3oC2h+RS2aPDqWyu9Ecg10zr3CqSW3QFg/w1t
	 KbxhXREJgrKhfv37DxeE72eXKL8O4RcSZxJafr7Hs4dNAThP/xY+QKW41NVswTSEEuy7P
	 5VRaXg3s2/J5z4TdHxetNA0Yly+Oen+sbPKSpULWBpN0DdajHZaneDabrbG/k12/Ipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pHJGy27mkOAavYT2vi2hpZfRzq++7pcZXDnBhnXmGvc=;
	b=Ae7/xc2g16fltTGDFzmF/TIqWGekN3YOK/MIvkl7tATPsSG1TmDlWRsEBn1wHJESojgi
	 CvgECq38ddMjPGi4hdFwCPZkU7vDH/hfa/eFdcGvk83K4hUtQ37G/lgvHZaLfSrsas22p
	 O2VG4a08ArRlbYjoEAkhMosZw92FaC4in67NlcDG7taXoruqcfSerNkzu3umm7JWyXDXT
	 ja6mZi1HmedWOW/TRIuLDsH55tCDQBLIj8p7TPn6rqpFR/6KyyKbd+mPocTer8PHvDZvM
	 Lg8b/nkCplXqGotdv6AF+C/PPelRO70y4qxXp3gHxO/BHDSuXeLkyEkbhfNlt2j+XbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+sz7xFb;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085D2606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 085D2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+sz7xFb
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd69954c755so48511a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113575; x=1795718375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHJGy27mkOAavYT2vi2hpZfRzq++7pcZXDnBhnXmGvc=;
        b=U+sz7xFbp0I/9UCiMP1pxoyrnB6wALrYqvmqu1pM8N19KrnCFIu8SS3l0j4MIE1gT/
         iYv4sT1rCFhI6WVSI13DRkOv1oVCjWlOj22UmmqMmqGbiFCyhNdp7piwXdyTVFPvr9XI
         DKYpn/JiIOmBUfvbZweANB+xst84KWDp6c7liz5BJWBbkJTLk7axrHgLYq8AUEN+5+P9
         kgsLno92kjGcHNd3jSe0Bf/cNuhYzcKdJIGTQV3lrTeZimrVfetmvilRv/Tsq8emdfZN
         kWEUT561oDhV5P++0bQGMZrzJlqfxsLVe8U6tGG7dxp+y2OiQdOkkY7bp/owGqG8+eFo
         Cdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113575; x=1795718375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHJGy27mkOAavYT2vi2hpZfRzq++7pcZXDnBhnXmGvc=;
        b=sEYmYM9PYp+RnaG5PX6df0FCQ7TyL7k5yhTSekMRFbSvsCPbQxkX6p946qgD9LLUHB
         UCfDhN6Z/FU3vQG5QtPL7rkQ/S7cIRZciC0Lr4Ms0nE8y28eDh79PBbdII2gJqfUvssQ
         0gaam2luvmGNwMrCKti0PwF6qbYGC6+tgBRcMJsrHS6YkKCiDIUBQf83O+t/Cjq8/+wy
         hwUIX12/mi1nuMpACarCXwa08twmW2iaNLrnrIT0lwR1UgEpcYTbAEJqDsS+KXThF6Qj
         Xbye75DCQ35VMSbSM9VbpBLIWOR/dEv3EC95Fzyuvda7PdEt5HcX2QWs1oVglL6Le5Uc
         i/4g==
X-Forwarded-Encrypted: i=1; AL+hErHu/MlWkuhUbHIBd1pq4TBqcr5FzA7Sx6iTl/iLseeXeE1KdsBm/R9b0CQ+XPBE9LY0yXuajgb5mIxUYT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Agai5mK13YFFZB01OGnEBeBzoRU++3E+B2j31K0DR+NqIT0lO
	AqN74Lqo524e1GOkajRgJSG96SdjLINgGJf6CGy9h4i2fwjRyKdYft9B
X-Gm-Gg: AYBFou1ciZ7cwhaI/IUvBUbbp+cC2OY1zXGKFLSZ/UpIsAwOHw98ZbM9m6YR42zdi80
	QPsjNp0zH0h4fs1JKsxZmOoIsMSDPB6mk0KNCr6Ex/L+ZNNVZiav5oN+hBPQv1G64DoJm6Xvl6g
	lyn3A6FusX/BL6Zsz6RLJEnzN873ImjQ2e4PAc05Lwvu3MLav3gSJq8/hGzQMOgp+edGQAlNTuV
	IkCKVfbEQcwisJ9bLoOcPW6BICrpxSfVP7prkB+07hfLDegmGJAvmQ3CffTlpI4vx6rMlrQr83R
	z5omIEuIweaf5IhedeVvpqflNy6B6aPB8Uokfqfu/oYtRqVuI5e9GY5mI6vJVIm6v6xZuFpFKiA
	3cr40i0hMEYsNaIvPdR05jMIszzGyNYg5+V8bmQy0Z3jkeRLIq9Q/nGtuG6ROxvqG10xbafwEwB
	u3ki3Doe2VOhKO1KYkknur1CNVXTxga1XSM0onC6vQ3bzV8zK5XHaQgJXWNS+UCQv9RXLNfJ3K0
	dBFk1EyclUXhkp4IQaQyuwyFuFqn8CPk8Au79Co3sUbPJYHXasqFpBH8Vv+9uvcb+gxRI633Gs/
	wegkZjsmQ0TXIgvJEYDLUJ6/QPzzeRulRWR57gfK8i+LgTesjUXRx/7s022PIN0mHh8AFYY=
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr539233637.48.1795113575085;
        Thu, 19 Nov 2026 10:39:35 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343fba6sm299185b3a.38.2026.11.19.10.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:39:34 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Hui Zhu <zhuhui@kylinos.cn>,
	Hui Zhu <hui.zhu@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Barry Song <baohua@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH bpf-next v3] selftests/bpf: Keep memcg test page cache off overlayfs
Date: Fri, 20 Nov 2026 02:39:25 +0800
Message-ID: <20261119183925.1482217-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memcg_proactive_reclaim and arena_memcg keep their page cache off tmpfs,
because shmem cannot be reclaimed without swap. But statfs() only sees
the top of a stacking filesystem: with /tmp on overlayfs over tmpfs, as
in virtme-ng guests, the check passes and the data is still charged as
shmem. memcg_proactive_reclaim then fails in a full test_progs run with:

  test_memcg_proactive_reclaim:FAIL:reclaimed unexpected reclaimed: actual 0 <= expected 0

and arena_memcg, run from such a directory, with:

  serial_test_arena_memcg:FAIL:child faulted the arena in unexpected child faulted the arena in: got FALSE

Reject overlayfs as well, so that memcg_proactive_reclaim moves on to
the next candidate directory and arena_memcg skips.

An AI coding assistant (Claude) was used to find and analyze the
failure and to draft this changelog.

Fixes: 0f9b1e9ef584 ("selftests/bpf: Add bpf_proactive_reclaim test")
Fixes: 1fe5a5cd01e4 ("selftests/bpf: Add a test for arena fault-in under memory.max")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---

Notes:
    Changes in v3:
    - Drop the memory.stat check, the polling and the per-directory cgroups,
      and reject overlayfs in the statfs() checks instead (Alexei).
    - Apply the same fix to arena_memcg.
    
    Changes in v2:
    - Fall back to the next candidate directory instead of skipping.
    - Poll memory.stat until the write shows up.
    - Fail when memory.stat cannot be read.
    
    Tested in virtme-ng guests without swap (/tmp is overlayfs over tmpfs,
    the working directory is virtiofs):
    - memcg_proactive_reclaim passes from the default setup, from a tmpfs
      /tmp and from an ext4 working directory, and skips when the working
      directory is read-only or also overlayfs over tmpfs.
    - arena_memcg passes from an ext4 working directory and now skips from
      overlayfs over tmpfs, where it failed before.
    - A full test_progs run passes memcg_proactive_reclaim; the only
      failures are fs_kfuncs (no xattrs on the overlayfs /tmp) and
      xdp_synproxy (no iptables-legacy on the host), both unrelated.
    
    v2: https://lore.kernel.org/bpf/20261117170704.1146730-1-lylin1023@gmail.com/
    v1: https://lore.kernel.org/bpf/20261113180159.602033-1-lylin1023@gmail.com/

 tools/testing/selftests/bpf/prog_tests/arena_memcg.c      | 8 ++++++--
 .../selftests/bpf/prog_tests/memcg_proactive_reclaim.c    | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/arena_memcg.c b/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
index c76a7eb2f01d..334bfa61be76 100644
--- a/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
+++ b/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
@@ -53,8 +53,12 @@ static int alloc_pagecache(size_t size)
 	fd = open(".", O_TMPFILE | O_RDWR | O_EXCL, 0600);
 	if (fd < 0)
 		return errno == EOPNOTSUPP ? -EOPNOTSUPP : -1;
-	/* tmpfs hands out shmem pages, which are not reclaimable without swap */
-	if (fstatfs(fd, &stfs) || stfs.f_type == TMPFS_MAGIC) {
+	/*
+	 * tmpfs hands out shmem pages, which are not reclaimable without swap.
+	 * overlayfs hides the type of its upper layer, which can be tmpfs.
+	 */
+	if (fstatfs(fd, &stfs) || stfs.f_type == TMPFS_MAGIC ||
+	    stfs.f_type == OVERLAYFS_SUPER_MAGIC) {
 		close(fd);
 		return -EOPNOTSUPP;
 	}
diff --git a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
index c22dcfabe856..2ba07916bdc9 100644
--- a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
+++ b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
@@ -30,7 +30,8 @@ struct reclaim_args {
  * being available, and a read-only mount cannot host the file at all (EROFS
  * applies to root too). /tmp is tmpfs on many systems, and test_progs is
  * routinely run from a tmpfs working directory, so both candidates need the
- * check.
+ * check. overlayfs hides the type of its upper layer, which is tmpfs for /tmp
+ * in virtme-ng guests.
  */
 static const char *workload_dir(void)
 {
@@ -40,7 +41,8 @@ static const char *workload_dir(void)
 
 	for (i = 0; i < ARRAY_SIZE(dirs); i++)
 		if (!statfs(dirs[i], &st) && st.f_type != TMPFS_MAGIC &&
-		    st.f_type != RAMFS_MAGIC && !access(dirs[i], W_OK))
+		    st.f_type != RAMFS_MAGIC &&
+		    st.f_type != OVERLAYFS_SUPER_MAGIC && !access(dirs[i], W_OK))
 			return dirs[i];
 
 	return NULL;

base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
-- 
2.56.1

