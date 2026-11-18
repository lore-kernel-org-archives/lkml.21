Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036514;
	b=LhHAGEcmxzpX3nJKvmVEbgeYSgLpaw/1p/xah7d1NxVIcrBdY6Srj9mGgntIShV1kJuu
	 Afi+E72pnCa7oD3OS6arhOik9JCCNWx1PWuMaEu5M1PPmCTqULJwp11KjET2pdysFBg0D
	 PiaDm/slAb36USjNqAmtcAP4vAaCLJNNbsoM28h9j5mBMAw/grkGwXNTrglOSM+6wVu3E
	 +EkRcZ/O5BXUCmM49mY+FB9q0y1S/JKKjv6R44I/4JuTaDmy+8/XXhzhhk/UYL8Madkup
	 iUcDj3gYsIEslQwby+9NCV22HyV7I9GzujPfGJ9tgU7YlJOImUGL0lCgn5kDHJQlgoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dQMT0iyssFp+SUjt/H/xp3SSQ9EubviEVTCBFM7XGyI=;
	b=15Fsh6XWG/6ay5YukIdBBl3xCQp6GdfIYFJSWCUw49aWKCOExqewbrDqbK8+8RrjxgUe
	 a2Zv01uJl3HfyutZQY43+6jBp0BJHC8+rAL3T+/QsGDw6MJ5hH7ZavlfQPjCwChF739Z8
	 yHAZ69PAsVCI6KOxD4JMO/4ruCXlz7WpQyw34RiO8zwlHgUQGNBFqiemrtVsxbCwFsPVr
	 TzTKSdLNRlWjn3iEY9XujPywKzqMtYNzxlaPlcnTsgeFMozlUOg+oK/KMYizyRW7k2omo
	 XPn4og1iIoRhnPQt3TezdrikXXzxQInu2wMONiEYLrcT+aRkMmlMgES0WtPNwFyDd3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l6T+ewem;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E6C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E6C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l6T+ewem
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso960876a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795036512; x=1795641312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dQMT0iyssFp+SUjt/H/xp3SSQ9EubviEVTCBFM7XGyI=;
        b=l6T+ewemSmDIS+zZRpl4QLm5f5I/r/IbXU1O4DXr7tZh37GKF3Zb2MidXPEXo3uVFg
         khkrntIWjj2H2V0/siMSFJNCw6o5Tb8i8bR0mT7rt/vTosaPAArJkQ2CYur0ZITzgV9Y
         a8hauKyywE+NAYkCRm3mbHjTIk178Srd/1L0RUP0jmgrju9VaZhWPW3a6w50TJhe3yzR
         BWTsPvIwYBcgDOdRiqC0fCbY9ON3zIszvZFRT8cggNIZIBPuutR4JCkpucZdfrpzTR9e
         jR9owf5tXFbwOnKQnqREWXqIEkxGt8SleZt9AaoiqRdjTD1Lh1fKPr15AREYf3UEGNEx
         VPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036512; x=1795641312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQMT0iyssFp+SUjt/H/xp3SSQ9EubviEVTCBFM7XGyI=;
        b=z7oiXSjanoFCyep+zVPHZxHmCwk+ngx8xrTseZPeCW5FMn9u4fMFxX9H6HUjNlo1Sh
         rrPqrN8TNZUM0dupqmJHjZjQTBTQ1KqnYRyD64W3SINFl5IFYwm/THgmGz+Y3kPAQ9iC
         4N4VhEMclt4L202ZtaId3Y5w90JrlVZ90ZS/b90nkCAidW+xe2vF32HbkKe7TDVju5kW
         7EkwrJZoUdw1BpVuncgFMQd87BwQKEnsV3UaEtG+4dvEhf8sx4KNDLxeyGDa6dp78vue
         eVYwkCGdaTT+AQ+CzVF0zKS/XQ3whNtwsK1U6KpN57GXw3FCPz4C2nE+Z6tfek1FZnFK
         i3WQ==
X-Forwarded-Encrypted: i=1; AL+hErHG57jcMRQ1RCsjr6ecFMiSRK7jR8UMnYyd+VVSBEtVy8yO3ctltk7gJSUWw1Hz0+wxSn5LFLZJHo2Vhu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BcfOeZTDtzM+vjRLJFfvMIjQHPFMo3pY4M7pe2CprZjdQ3Kws
	6HvYnrDLRPX9+CXe+sojNRFRZjcD/RoDxL87Y2YV/GOVXzfIh2FaK9EURfNMsjRVsxY=
X-Gm-Gg: AZFdTZf9sd2/DDxJvwAA4dJcpEaxbcq6QUa1PLxATSrjBNJ9rdb/IyIdD1gU/8M+ruE
	n1lePEwwrcumPb+k8nQJvqtwP9v967hcrHWkOOk6Zdri97vVVCwYSz05lsWPkGEXFh5xpNO8Kaz
	j7arcGDpnGm4KvV69o7PizNvXgpYSVi+ljHN7EEp27ZJ/GnFQEnTJ+xBMiRMDZ0TF8fHQd0psgz
	A4XKVoVy2pBtbdBoncywrfSHUZ2C74lTHzhx9PIXb6j9H9IuHWaft5mh8LeElaj1uaoaMamrRdU
	u6r9QzIJLImwNrsPAvlYAh8CL8LUDVEU++T0YxFYZGYdX5HAdxhZMPr0fqo0Bti75hND0gmAFiL
	GBsnNhEs6VKryeoClkz94ZFFQHfsJlGX7c+x+fUlS/dgMoy++6PPqRdNA+jjpf8OEh8E+54d/7Z
	VSoX7OKBPAqwuYo5WxgaaeSXI2Lj1hFU1H0ZIFwDyF9E6oFXiFLQVhU96nhERFwIe8KShFqbkQx
	Mhx+sR6uDYqAGFnoroceg2rmTim96ob0wR+n1Xd5Q6ktA4OlkkexTRsEOOMTvxAVuTRlMlHn8fP
	LecqDBx0wqLZYVK+J6UKZvD2QIG63Y7H9unBa3nzLxCMMlVKVEcnYD353f1xR5I6Toen9cYCirq
	LqI31ocRhut6gJyLEcNVw8yvx5xmCIbh4qACjEg==
X-Received: by 2002:a17:90b:5348:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3b3d07aa794mr4044192a91.41.1795036511842;
        Wed, 18 Nov 2026 13:15:11 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5689adasm2611719a91.1.2026.11.18.13.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:15:11 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sagi@grimberg.me,
	jgg@ziepe.ca,
	leon@kernel.org,
	mkp@kernel.org
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] isert: the commands the target core allocates itself
Date: Thu, 19 Nov 2026 06:14:59 +0900
Message-ID: <20261118211503.2526705-1-yhlee@isslab.korea.ac.kr>
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

Link: https://lore.kernel.org/all/20261118113905.2361969-1-yhlee@isslab.korea.ac.kr/ (v2)
Link: https://lore.kernel.org/all/20261116101108.1650132-1-yhlee@isslab.korea.ac.kr/ (v1)

Changes since v2: 1/4 is replaced.  Comparing the opcode inside
iscsit_find_cmd_from_ttt() stopped a Reject being taken for a NOP-In, but
not two NOP-Outs being given the same real NOP-In, which queues it for
removal twice.  1/4 now gives the NOP-Out path its own lookup that takes
the command under conn->cmd_lock and clears its tag, so only the first
answer gets it, and it leaves iscsit_find_cmd_from_ttt() and its Data ACK
SNACK caller alone.  2/4 to 4/4 are unchanged.

Answering the review of v1 1/2 needs two patches in the target core, so v3
has four.  1/4 and 2/4 are drivers/target/iscsi and 3/4 and 4/4 are
drivers/infiniband/ulp/isert, but 3/4 depends on 1/4: it lets a Reject the
core allocated reach the wire, and without 1/4 first that turns a NULL
dereference in the base tree into a double free.

1/4 is not about iSER.  iscsit_find_cmd_from_ttt() matches a command by
targ_xfer_tag alone and leaves it on conn_cmd_list, so a NOP-Out with a
reserved ITT and TTT 0 is given the Reject the core allocated, which
carries TTT 0 and is still waiting to be sent, and a second NOP-Out with
the same TTT is given it again - either shape ends in a double release.
Both are reachable on plain iscsi_tcp one PDU after login.

2/4 keeps the unsolicited NOP-In off iSER.  The transport check in
iscsi_post_login_start_timers() runs once, at login, and
iscsit_process_nop_out() and iscsit_na_nopin_timeout() arm the nopin timer
again on a connection that is already logged in, so it moves into
__iscsit_start_nopin_timer(), which all three go through.  Gating it is the
fix rather than only the dereference because isert releases a command on
its Send completion, so the answer to a NOP-In cannot be matched to it.

3/4 is v1's 1/2 with the fix generalised.  struct isert_cmd is all zero for
a command the core allocated, so the back pointers are filled in where the
core hands one over, in isert_immediate_queue() and isert_response_queue(),
which also covers the ISTATE_REMOVE the review pointed at.

4/4 is v1's 2/2, unchanged.

Measured with KASAN, one fresh boot per cell, arms alternating.  On an
iSER portal over soft-RoCE, 3 boots per cell on the finished series and 2
on the intermediate stages:

                                 base    1/4     1-2/4   1-4/4
  Reject + NOP-Out, TTT 0        Oops    Oops    Oops    clean
  the same two PDUs paced        Oops    Oops    Oops    clean
  nopin_timeout 0 then 3         Oops     -       -      clean
  200 Data-Outs, nonexistent ITT 128      -       -      200
  one Data-Out over TRDSL        Oops     -       -      clean
  login/WRITE/READ/logout         -       -       -      10/10

No cell at any stage produced a double free, and the finished series is
KASAN-clean.  Where a cell oopsed, the use-after-free reports that follow
come from the teardown of the killed thread and are the same set at base.

On plain iscsi_tcp: two NOP-Outs answering one real NOP-In are both taken
on base and the second is refused with 1/4, 5 cells each; 20 Data-Out and
NOP-Out(TTT 0) pairs in one write give 19 or 20 KASAN reports per cell on
base and 0 with 1/4, and one legitimate answer still works on both; 3
cells each.

Yehyeong Lee (4):
  scsi: target: iscsi: retire an unsolicited NOP-In only once
  scsi: target: iscsi: do not arm the nopin timer on an iSER connection
  IB/isert: finish a Reject the target core allocated itself
  IB/isert: do not leak the receive descriptor of a dropped Data-Out

 drivers/infiniband/ulp/isert/ib_isert.c   | 41 +++++++++++++++++------
 drivers/target/iscsi/iscsi_target.c       | 34 +++++++++++++++++--
 drivers/target/iscsi/iscsi_target_login.c |  5 ---
 drivers/target/iscsi/iscsi_target_util.c  | 10 ++++++
 4 files changed, 72 insertions(+), 18 deletions(-)

-- 
2.43.0

