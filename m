Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094234;
	b=MiYmzxRxRibBmYzVZ/Z1J/oX0S7QnvJOTCnKl8aiMIL1Wu9MOr5lk49wI79gOnoKxS0P
	 pMlq+2NcLJHYHBkcR7RDQljZVRidoCjufV21IwQffvc7K+gEcds5wNpBrhRRLrRZLwRQO
	 Q3u0lRvxAyoruhqvTtQaEevEbiA9r+Q3YAHlT8rPrWi+BMfFg2tHZZ3mtrGszFSscYru2
	 4l/stz9I5YcKI8DFjma6Y4pvaznjz81+DwtNiCyalqSQRduf7FeJNCWnCW/ZGE2HNECwM
	 FUOK4kn9PWiYD0kXRAKsG1Spd3LqvXsIKQxpeub+NJrGVb/7Vhv87a9L/yXjBWQC5Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L4E3XRP64cRcg2qhwnD/p3VNtz1wiNwPHBJ/utwvJVo=;
	b=feIawRLre6WXDV9bfoBtbAkOuILifMmRUAXS6sGdEY2Q7vcbabt81nToEFOhdbIwM9qi
	 4SY4lFU1f6NEVfMfK5MtNVeUwISUu3mKvgVvcz8WicygtK+3wdFeZ/ROybid1HOP0MINK
	 d6PDbs7dqZudJqI5AYwfr5KLUFkNwsRlLjhocYO7JYqXFd/ilIuWPcsa3egPx/D+Z/Lu2
	 nv1mySjs5hg/QLOF9gS2g0jiJCHl2AMs/d1a9jaU/VOu3AlpKgKcSpHSl9hoVVKa6Ddm6
	 jIISxlwiAYObJJUXarzd0GRAX+C9Ai1XyYbwDe+Z/ywxcCmrqC8qqpb4MvErAjzHjXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mfaF+RhV;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E44606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E44606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mfaF+RhV
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1338056b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795094232; x=1795699032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L4E3XRP64cRcg2qhwnD/p3VNtz1wiNwPHBJ/utwvJVo=;
        b=mfaF+RhVNLCmGyPAQrRmfCi5qQBk1BaBMHoIYOtwU5J2gBn6VuxzPHneB2WUiGf1Tz
         PWC6V/su9l5fONkjmLnBlo+nNekwTWOVsHUEyVQfXS4pNz044toX35uj0xg1prBfCUR6
         N4zV/1HGN/X8zJ+5yAaI3RY7awvHgx0zexu0j7z6fH6w5u60QP6ROsFjY6XHUueKmyWy
         WytUKeFAIatM6QkLFjAh3hAbiLxMm0o5RMtXEI07DoYTXXjA8oybeyr3bmkUPVIPrQAU
         ulfyB5uahgeEfaiujqv2NIYZPSbKnH86gMW8y3jZdcgNGVGIKG5029rDLl7N56diRNz4
         WeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094232; x=1795699032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4E3XRP64cRcg2qhwnD/p3VNtz1wiNwPHBJ/utwvJVo=;
        b=fW8uCR97SUB817EpGKVn80fjUlRIy0GlkuPAQ3f3+lYDC604mRhhThdxqBLDy33DqJ
         174X/XMnLA0Bg6JTFc+1aSQTzIFcCn4QLdijBdwGM5M+PsQbIKOKZ4ooCkXltXjMDNuB
         WheSrsV12PVFeH/jEt+a95TGJetOEJTm/lwiNvXYeEpYoKM0J9GQhVQCT5svqYgmodxH
         3HI0SYE8xd6OHoIH7HGPa+8FQAiC1A9CYgIS2EyvWlQgVbc8dZfIq02hhZmgkpHIyGAE
         KtAdbXaIp2sarlD99ggtzLCKX0DBoQb9VGMc8MQAW59h4v68EjxI8E1pkynQgL7AgV6d
         Dv9A==
X-Forwarded-Encrypted: i=1; AL+hErGUMVv96dhg2SF3+IU0fv1r+tYcE7BZZceB6wGx319HwDT0ZoJ0U+aYcQeV+0vSMb1WsrIj8TawSRp7uE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9chJv8y3iOJdg3rNsnm79nxo2OHdZixLhKTTjG6IojZMBMTocO
	u8GVkznU9DJF5GLAN+N9avpsjQ36M1aroCU+Aw6OyXlxT0RSZ/3a1dn7znYsNsD+SAubWotEVPG
	xp1A/Vto=
X-Gm-Gg: AYBFou3TLKaT297qv4cbnl8I+0ama7IOfdaYRu7gGHLPfT4i1vIIegujm1LgYwRYIzo
	uSQw40+z6ziHyWMwDRkPEcRfNqg2PnxfypjWkmFotvCdvCvprctdlXP20oQ/FwEZorrbp/rxjGG
	DkgNYjkgwHdfA6IiIXS0iK6TYfeR418xgWSixQaCHVvY1EB2viMl2LZ85oLMk1/pvyV3yxgQ2jZ
	DH6Pr3BnhpY1J21oZBtf/5tjUG0PkM6ZIAD9wcp6awDLyemKgQwOOeeHNTmjr5iDbZ7yaTJ82Yd
	7DLOAvt1/k/AVarrZsGJVxCdwoNLx9P5z2vNFWc/WzM/+BRH0LCcJgvFidWV2pUersRzje6F5X2
	ZrBlLRY7E6hqELkvJTeUnDoLOX5rIRn6LW61DfXgUEHRYIvSPLMEZmxXcNgm0EsdZIYST2ofWXW
	V4/nnw6NkR/QGO8t+1TZgFDendu4MlZXw+4cadu4m45IAa9M65YjmFmiE4eIu1aN/xROlcWEGgA
	h5odA7vnxxEcfC2wHvfDU2ArXFwtKPWxagCtWKRQ5fFlCy9oqW129NjCqzOeVhrPni3SJcWeowr
	BVdRttfs98H8Yj6QpySCERR5KTHcmcBDLMGOZ35jNw0K5uAScuT6ag+B4SyWm+YCJnVNAAs1qH9
	8yiXXVgbzS+7kLSpiR46CXFR3AEOsIO+B8ug8RXVEBOzTr2uBjtttFcAvBUY=
X-Received: by 2002:a05:6a21:66c6:b0:3e2:acd2:b94 with SMTP id adf61e73a8af0-3fe97bf5bdcmr1281756637.35.1795094232170;
        Thu, 19 Nov 2026 05:17:12 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:1076:1f1f:dde8:a816])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99f91sm2809467b3a.5.2026.11.19.05.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:17:11 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sagi@grimberg.me,
	jgg@ziepe.ca,
	leon@kernel.org,
	mkp@kernel.org
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] isert: the commands the target core allocates itself
Date: Thu, 19 Nov 2026 22:16:56 +0900
Message-ID: <20261119131700.2722108-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

Link: https://lore.kernel.org/all/20261118211503.2526705-1-yhlee@isslab.korea.ac.kr/ (v3)
Link: https://lore.kernel.org/all/20261118113905.2361969-1-yhlee@isslab.korea.ac.kr/ (v2)
Link: https://lore.kernel.org/all/20261116101108.1650132-1-yhlee@isslab.korea.ac.kr/ (v1)

Changes since v3: 1/4 is replaced again.  The review of v3 1/4 is right.
iscsit_add_nopin() publishes the command before it queues the send and the
tags are sequential, so a guessed answer can arrive while the NOP-In is
still only queued; the lookup then queues ISTATE_REMOVE ahead of the send
and the tx thread sends from a command it has freed, and clearing the tag
before the header is built would also put 0xFFFFFFFF on the wire.  That
window is in the base tree too.  1/4 now marks the command with
ISTATE_SENT_NOPIN_WANT_RESPONSE under cmd_lock, after
iscsit_build_nopin_rsp() and before the PDU can reach the wire, and
requires that mark.  2/4 to 4/4 are unchanged.

Answering the review of v1 1/2 needs two target-core patches, so there are
four.  1/4 and 2/4 are drivers/target/iscsi, 3/4 and 4/4 are
drivers/infiniband/ulp/isert, and 3/4 depends on 1/4: it lets a Reject the
core allocated reach the wire, which without 1/4 is a double free.

1/4 is not about iSER.  iscsit_find_cmd_from_ttt() matches on
targ_xfer_tag alone and leaves the command on conn_cmd_list, so a NOP-Out
with a reserved ITT and TTT 0 is given the Reject the core allocated, and
a second with the same TTT is given a NOP-In again - both double release.

2/4 keeps the unsolicited NOP-In off iSER.  The transport check in
iscsi_post_login_start_timers() runs once, at login, while
iscsit_process_nop_out() and iscsit_na_nopin_timeout() arm the timer again
later, so it moves into __iscsit_start_nopin_timer(), which all three go
through; isert releases such a command on its Send completion.

3/4 is v1's 1/2 with the fix generalised.  struct isert_cmd is all zero for
a command the core allocated, so the back pointers are filled in where the
core hands one over, in isert_immediate_queue() and isert_response_queue().

4/4 is v1's 2/2, unchanged.

Measured with KASAN, one fresh boot per cell, arms alternating.  On an iSER
portal over soft-RoCE, 3 boots per cell on the finished series and 2 on the
stages; the base column is the v3 round, whose binary is unchanged:

                                 base    1/4     1-2/4   1-4/4
  Reject + NOP-Out, TTT 0        Oops    Oops    Oops    clean
  the same two PDUs paced        Oops    Oops    Oops    clean
  nopin_timeout 0 then 3         Oops     -       -      clean
  200 Data-Outs, nonexistent ITT 128      -       -      200
  one Data-Out over TRDSL        Oops     -       -      clean
  login/WRITE/READ/logout         -       -       -      10/10

Where a cell oopsed, the reports that follow come from the teardown of the
killed thread and are the same set at base.  All 18 are clean on 1-4/4.

On plain iscsi_tcp, base against the whole series, 5 cells for the first
row and 3 for the others: two NOP-Outs answering one real NOP-In are both
taken on base and the second refused with the series; 20 Data-Out and
NOP-Out(TTT 0) pairs in one write give 20 KASAN reports per cell on base
and 0 with the series; a legitimate answer still works on both.  With the
add_nopin() window widened by a test-only delay, a guessed answer is taken
in 17 of 17 attempts on base and refused in 19 of 19 with 1/4.

Yehyeong Lee (4):
  scsi: target: iscsi: retire an unsolicited NOP-In only once
  scsi: target: iscsi: do not arm the nopin timer on an iSER connection
  IB/isert: finish a Reject the target core allocated itself
  IB/isert: do not leak the receive descriptor of a dropped Data-Out

 drivers/infiniband/ulp/isert/ib_isert.c   | 41 ++++++++++++-----
 drivers/target/iscsi/iscsi_target.c       | 54 ++++++++++++++++++++---
 drivers/target/iscsi/iscsi_target_login.c |  5 ---
 drivers/target/iscsi/iscsi_target_util.c  | 10 +++++
 4 files changed, 88 insertions(+), 22 deletions(-)

-- 
2.43.0

