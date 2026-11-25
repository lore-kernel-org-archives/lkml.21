Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630103;
	b=c1ezaWgoL15bdHiju7atpuEyzrfhWAVbtoi1RcOE5iBnAu/Qejjmz2bqBw+8f3pFd4cj
	 L0jxoyToEHYlYpUn5p/Y3wDydXG21LDi6XV8h7vaQEeQ0zRs56IBttpu1wg7foBy7khvo
	 59Y9a9hB27OJ+2vktSneEVyXTnLiJcmjDj17hy5ug9TLZ4/j+qxBFng5GanM6ND9Yr+2N
	 aDNsdTARBpyv/L7xnXsP9tnBGBOSbPIxsITHaw0DWinIIZyeuJRo6FscippO5yjeD6Dwj
	 cu00sILLvglbPvPZEsT9RnzbPakLDgFh0CfYgZ4poD4AXmptntd6+e1GRZA44rrNzqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dHM8QuM6MY/pSqOPOop7gPxP9CND5feIuBhfsBIhnlk=;
	b=udE0a9z49jydsoq1VsBHIkk033qf3E6gphbWyxZeAFg37uZ5GEluS5ydn19WKk0AlQ6y
	 W6srclI3UBdKPDvM3e9w4zOF0y2xXNtbnGsvzUeKk3eeU0aX+rRuRyfEJbWxwfYkUzM9v
	 oOCy66W8D2J+it2IbN8wSvulbt70+B4vz/sAui52Oh6LQoa3hlB+J/cWTJdNypmGhsEjx
	 WMkXYTFIYENXfxU+AXlTbBVB4Sy6+07Aq0tbIc7Bp5R/a5QHpfB/ard0zvEMxnpSCX43X
	 WoGc2CljGZZNBYqMjjDfwFtYYy62XEWdOqS2d55Qa/1bwSnc30sb+2rmvix8tWGI71g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Pw1yTcSe;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B9606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5B9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Pw1yTcSe
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4dbdc9592so18727567b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795630101; x=1796234901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHM8QuM6MY/pSqOPOop7gPxP9CND5feIuBhfsBIhnlk=;
        b=Pw1yTcSew1tJWPymC+EtTRZkEr+5tKy29+ynnVbyUao6v1cTb3h2c86QP8jy2LO7iB
         v3EGy9XAL8lNHqht6WJpIjOhlALmCvzgkursP11zUP4ceia2Bf5Px8hg00FFcASj07FI
         co0UQR4YEGuawnGC/1HPrkLdeTp/NImxuNm2SK7ZieoqZyw+TCeGN6u8+dBG7Gfyvfts
         FxNKHYh7zU5qp2y3JDdtDm85fOcJb3tYbJVAXetO70nLmk/mDWj60TXlkRC3Vw9uZONM
         C8gKtG6H7Qm9+1xB8dKpGvgZcu2SXU7jH9RaP4y7R8bPA8NbPUse1zMMOH1hi+BnjN3P
         ubww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630101; x=1796234901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHM8QuM6MY/pSqOPOop7gPxP9CND5feIuBhfsBIhnlk=;
        b=Se2UaXY1f3FFil2uJOHzklzDgVdn9LuWGrEodQtuv1Ug/gk5BUgN5YNQOFxxvkivRg
         sh0D73Pc4gWBVRpLQhA4VVXj9bQWfnBZ24Mdd3ou1o3lIapHPU932bynx5n3fYJUL0AM
         op8KJo40bmbc203QTjJZwLSkWqeH9zo7BquFATcdpGS1H9p08EfF9ffpmHlAivqK+/uo
         8GVKjiAQ7NPnXPYvR3/KAqLKVWhpmb6VOt8BAKV21J6L8qgYhc5AH5XnMWd8oRSkgF49
         HdYWoqAcVA+Y2ldOOFHJ3oo3FSY8iteDldQPgu+/kcLGsLQ/olXcrC/J2qZ0F0z8i5mc
         Fpqg==
X-Forwarded-Encrypted: i=1; AL+hErHSbpaqEPZpWesBhd97HjOKeK3XuV5BYgCo6LUX+uNRYh+ZIAXRec1E8UpjFyYgzCjpdx9ZOkc77GIjHZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aF41B40bAZTlJis6CtSDwzCiTe9JAn9qf02pwLyKir+jFs4Al
	FYLNMHfNWmwqs5wGp6wykfLvPQ7/xOPYiqrkvU8wu6//rWLprDrdra4gz9jp4alACQ==
X-Gm-Gg: AZFdTZe6ZjP63sFRBY9pUAeX9fYXSSkp782oYheP19Ks282wqsT5yj5znL7V/5SYN82
	B+c08DloOvzjueaRzCEhFB0dOH/v2uDumbb7/o0cbA67frSAKxCO++LTZCTUrWBI3a4ul0ExtXX
	FXAL+mNug1Cqs4lq3ajA91JZ9SSMHImA5DGbYxBekt3xlLJxi0B6UhwydgSI3AfwHsEGi/M7+DB
	zzhp90EkVJU9qPovc2GcMHkXb/4EhmsZFbPmaUFnjgSr9AoNtFcO3+E93BmGjXc4USn6MVy2V0j
	9FUwMPg+PfaxEDDN5rfnUc1rGm9PPDlwBFeCmLJyT3G2XpzluFw1UOg1jdMy3SFbw9jnerj0NFj
	VBiXTMiSfja/dmY8dxVupCuXFwdDXPkNUxqxk9Bm8dKURQUdH6nBw28+sbkl8QjJY5EB8kc6Dzj
	RqNJiZ/YOfpRbqZjcU9GThCOVhyTN9WxtSb4R/Os8E2pAO179W710lpZ4tXzBuPRB7InkOFp4P4
	9L8oVvoIVpaSVywjjPSFyrj/8GYxVVPn9S9C8frpbcb63GiH4+4vLbOxrCpA1b7/djNugGl21Es
	wJIlIBWP7sKLp9DUqb8j83dbCj4OSAqtyZsvvh/Xd136jqPwj0MxdWojOytcOrjnYl2Wsavxig=
	=
X-Received: by 2002:a05:690e:1247:b0:67d:ebad:8ca2 with SMTP id 956f58d0204a3-67df4410cabmr7287298d50.53.1795630101276;
        Wed, 25 Nov 2026 10:08:21 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df337bfd7sm9193210d50.15.2026.11.25.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:08:20 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	Christian Brauner <brauner@kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/openclose: allow an empty path with O_EMPTYPATH
Date: Wed, 25 Nov 2026 13:08:17 -0500
Message-ID: <20261125180817.3682397-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
made build_open_flags() accept O_EMPTYPATH and turn it into
LOOKUP_EMPTY, so that openat(fd, "", O_EMPTYPATH) reopens the file
behind fd.

However, io_uring also uses build_open_flags(), but __io_openat_prep()
still copies the name with delayed_getname(), which rejects an empty
name with -ENOENT. As of now, IORING_OP_OPENAT and IORING_OP_OPENAT2
accept O_EMPTYPATH, but fail on the empty path this flag is meant for.

The issue can be reproduced with this program:

    #define _GNU_SOURCE
    #include <fcntl.h>
    #include <liburing.h>
    #include <stdio.h>

    #ifndef O_EMPTYPATH
    #define O_EMPTYPATH (1 << 26)
    #endif

    int main(void)
    {
            struct io_uring ring;
            struct io_uring_sqe *sqe;
            struct io_uring_cqe *cqe;
            int fd = open("/etc/passwd", O_PATH);

            printf("openat: %d\n", openat(fd, "", O_RDONLY | O_EMPTYPATH));

            io_uring_queue_init(1, &ring, 0);
            sqe = io_uring_get_sqe(&ring);
            io_uring_prep_openat(sqe, fd, "", O_RDONLY | O_EMPTYPATH, 0);
            io_uring_submit_and_wait(&ring, 1);
            io_uring_peek_cqe(&ring, &cqe);
            printf("IORING_OP_OPENAT: %d\n", cqe->res);
            return 0;
    }

Before that commit (v7.1), both calls fail: it prints "openat: -1" and
"IORING_OP_OPENAT: -2". After that commit (v7.2), the result is:

    openat: 4
    IORING_OP_OPENAT: -2

This patch will copy the name with delayed_getname_uflags() and
AT_EMPTY_PATH when O_EMPTYPATH is set, as io_uring's statx already does
for AT_EMPTY_PATH.

Fixes: 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behavior of different kernel versions.
I used an LLM to analyze the problem and to draft the patch and this
message, and I analyzed the result myself.

Tested on io_uring-7.4 (0659e44ce739) with KASAN and lockdep. A test
that runs 24 cases through IORING_OP_OPENAT/OPENAT2 and through
openat(2)/openat2(2) now gets the same result from both (32 of 42
results differed before). The cases include O_PATH and regular fds,
AT_FDCWD, forced async opens, RESOLVE_CACHED, a direct descriptor slot,
a bad pointer and an unprivileged reopen of a 0600 file (EACCES). The
liburing open tests and the openat2 selftests pass on both kernels.

 io_uring/openclose.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/io_uring/openclose.c b/io_uring/openclose.c
index 24cf3ce2e2bc..29fe31f16a2b 100644
--- a/io_uring/openclose.c
+++ b/io_uring/openclose.c
@@ -54,6 +54,7 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
 {
 	struct io_open *open = io_kiocb_to_cmd(req, struct io_open);
 	const char __user *fname;
+	int uflags = 0;
 	int ret;
 
 	if (unlikely(sqe->buf_index))
@@ -67,7 +68,9 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
 
 	open->dfd = READ_ONCE(sqe->fd);
 	fname = u64_to_user_ptr(READ_ONCE(sqe->addr));
-	ret = delayed_getname(&open->filename, fname);
+	if (open->how.flags & O_EMPTYPATH)
+		uflags = AT_EMPTY_PATH;
+	ret = delayed_getname_uflags(&open->filename, fname, uflags);
 	if (unlikely(ret))
 		return ret;
 	req->flags |= REQ_F_NEED_CLEANUP;

base-commit: 0659e44ce739ecd856164c75a5325b7959a2921d
-- 
2.53.0

