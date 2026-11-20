Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132938;
	b=zlnk8P0y+Ou/XQ8PYl2VR71DM5Av7GsfscFsgVjNtG3gYQkQmM1W8Az6a7Vx0SkOPKI9
	 5CosJgCUaSh0QjhInYJGTfhrV+fCm4G5pvC7NHU3kJ+LtCPkaPn4BHAB8H5g7TCKnzY4f
	 v0GPggdSYGffW/XlL3dblz2eywBn8VQIfol1/lDd7g7sji2H1+rhTv651nW2CNIynovc5
	 lftdsdNbys24iVze7Vvjo5sGhpkt04hPhNE9OQMckq6CzPxjkpGyY8lfcK1+nvGGwUGel
	 +u6+kaiP3EZEnHqjjsXZC45Sp/YvkxL4SWnUNOepCfp98xSn/hO9FFYD2q3utO2kJAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=84tD0PsJv6l6Ov4ThwASTzNvZKHlK3zUmVj0Eq3Ddgw=;
	b=3h+DxPmlnR4aIzCBm3GdB7qNhS1bPI7xIVW3byWDrXOzB/JvLb0/AKBP6InJCYScDafP
	 /Ok3LbEzgIe80T4bgiwKUTeV4DPmwqHjqJMuK0WL7dZwW8FpAMYI0SBBdsWiTSsD7fz2i
	 QIDVMdURmO3rz4rZuLqKaZykEk4Y0qx+qHJ/HegY2H6Gzjx6fDdF892qurFaqQurXm0uT
	 RZwI2s991p1+3YevaqW2lpzObuJuePDRgiH2gY2DWEOpOW/SkFs3ee7gMFwfUo3ylXV4W
	 IxmuB5yT6k9EsmcThUHZv0NA4P9IqOy9V/fLV8L6CvCKFj06S4UwlabKkCufZjOh2oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSibu5eG;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD93606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD93606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSibu5eG
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55ade1de0b4so3808521cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795132936; x=1795737736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84tD0PsJv6l6Ov4ThwASTzNvZKHlK3zUmVj0Eq3Ddgw=;
        b=LSibu5eG+B9bGZQiphsS4mZTkdkfLEX0be8mxdxpvtNevnhhTNlSATJSbbhjbSKmo9
         eLUkOqOF3a5WoIlDNO8EEEEZcGyA0d55HHkcMFxZ5NiHNmnRRTXcZwFKKjE5EyFPOfEZ
         aFNed9FC/lrVcH8sBRAr4sDX+xf9Dj3T4dpZUnsw3HcZEhARr9ffskNS5LVXtK8xB80Q
         q6hylW5EwOiGIu0zyq0/9fH+lhfOntlikBOC8bsiklG/57IH8zkq33bNChuxkoD2fjQY
         bo/pGVj5XoeckqArivVZ0rnfSXpD9KnfkXNTaYFgNwXc9FZQXIdzkc+qEebnxjqebSNc
         02Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132936; x=1795737736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84tD0PsJv6l6Ov4ThwASTzNvZKHlK3zUmVj0Eq3Ddgw=;
        b=uGZA1XYUC4Ro/oRVNjzbBYHUu86Lv0knSwTWqCvileRp4VWrO9Hz4885CwvsHRh6Cx
         nCa+zluIUespHkkTa7R8W96UGPqG5vdhXF3rYyI6dzk1OEzafqy45/tc+TV5gaeLXx4i
         K8SWPKxOCWouIDYvao9Ws9I/YFtsj8JKoilGuq2tRdBfZIOlY+zCZFuHI94Khre2ZVMb
         LEST8tkE2kFY7QDNel/2f69WaQzc1HneluouItQa7ZJTXjv4i34HSCNHuL3cbL5+lOtl
         MOYlWDxGfX7YWbTN/5w734CqoD1PxalgjjjYawzoq1+9I6GC9FnD+DUjeeJQCSHrlmJo
         o6rA==
X-Forwarded-Encrypted: i=1; AL+hErGilD82WAzxhmBekhZhUAwjUnu1VpX4k4L5Y7cwZw9EpjdY0TGKixB8JZ9+noeA32EJFUXnEqOFIIVJxs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hgyGMMZ1NYA0LFSUriOqm8e7jVFwpGiHiwMBkUer58y2n1Tp1
	dKo8gG3NQVWsUH9vwg4qHzl0YkTDwcBL/YUzW7Q2EFJpTD1FVOi2F3vLNEC8s8iNwIM=
X-Gm-Gg: AYBFou0UTw/XqbpSvQ+rDJe6uq3MeKFcXLbu1xVWNpRCKj0rC1OaQl1fYLgHPhwJGo+
	JEn/O4myamGcYvw0xG713ix08kGkin6Vo7tZDgwBPpQtFIWYIpd0vIphAqUMl1CfXZfHIGMHHBQ
	iz1FK4i1bKLrITzStxf4kR8pDt/Xr/bhpYXYe5uP+UTfFxYfuf0mv89c2umC1BaE2jrrK7f4sWF
	H/Wfa9ra+h8N4vAQRU7gFuQbxb5gp5P9JG2VRC11w61hMtvpiCfHR6GHotioO77rc9r5PiqVZgb
	7WGrML2dnMupeMByKyy5ixqsIqN10WoCafBLAtgEX+Xk47OlY7bYa6hO62B656g2GBWYxWAcHtf
	LcEJSjKNVi6+4S2wN1oj0Dcg1fU4vyo7jNrxtdxO0sV+ds9odA0oGssOopmCZz4C8397Na2Iv8x
	Vaz+BNMYfPXDILRMU3OJZ0A53TL/khxNyXjQVR+0PXVBeRoqXXfeMFXchAuYU/UDNZmwUr3GUR1
	BKy6Ushyl4XLqpW3V0AUubDFMzaaeZ1IzWplQUJlj7WIi5b5jq5ENBe+M8UU1Fau9Gzhsth0fez
	HbgR+O6DkEUzlPLyIsuPBaq41Oozqessdi9rYzgn1ctir3S8UvypHc0uXdSLmYQ9Kpawxe3bWFg
	oUtRgg78ugRgdqKC+R73DytA814q8rLBZSJeWgX5fAgHzqhFRCbpU+2YnDGXpatToEpGeoTxroZ
	5vZdLrwjRUyAUcB2M4+RcqyLrkevM=
X-Received: by 2002:a05:622a:2609:b0:55a:df3b:38d4 with SMTP id d75a77b69052e-55d76b5b9b8mr27871611cf.75.1795132935854;
        Thu, 19 Nov 2026 16:02:15 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c935:f347:a919:9f78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78807b5fsm8110401cf.6.2026.11.19.16.02.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 16:02:15 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Bernard Metzler <bernard.metzler@linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc] RDMA/siw: Reject opcodes a user send queue may not use
Date: Thu, 19 Nov 2026 19:02:11 -0500
Message-ID: <20261120000211.63217-1-astellman@stellman-greene.com>
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

A user QP's send queue is mapped into the process, and
siw_activate_tx_from_sq() only checks that an SQE's opcode is below
SIW_NUM_OPCODES. siw-abi.h marks SIW_OP_INVAL_STAG and SIW_OP_REG_MR as
valid for in-kernel clients only, but a user process can still post
them. For SIW_OP_REG_MR, siw_fastreg_mr() then uses the user supplied
base_mr value as a kernel pointer to a struct ib_mr.

The uverbs device is mode 0666, so once an administrator has created a
siw device any local user can trigger this. With an unmapped base_mr,
as an unprivileged user under KASAN:

  Oops: general protection fault, probably for non-canonical address 0xe000042828282002: 0000 [#1] SMP KASAN NOPTI
  KASAN: probably user-memory-access in range [0x0000414141410010-0x0000414141410017]
  RIP: 0010:siw_qp_sq_process+0x38b/0x3c10
  Call Trace:
   <TASK>
   siw_post_send+0xecf/0x20b0
   ib_uverbs_post_send+0xf28/0x1610
   ib_uverbs_write+0x899/0xd30
   vfs_write+0x227/0xcd0
   ksys_write+0x17c/0x1c0
   do_syscall_64+0xdf/0x4c0

The task is killed, and then hangs in siw_destroy_qp() when its files
are closed on exit. Posting an unsupported atomic or SIW_OP_RECEIVE
instead hits the WARN(1, "undefined WQE type") in siw_qp_sq_process()
and leaves the memory region named in the SQE pinned after the process
exits.

No opcode from SIW_OP_FETCH_AND_ADD up is valid on a user send queue,
so reject them all.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: f29dd55b0236 ("rdma/siw: queue pair methods")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---

Tested in QEMU with KASAN on v7.4-rc3. The patch applies unchanged to
rdma for-rc. With this patch the post returns -EINVAL for REG_MR,
INVAL_STAG, FETCH_AND_ADD and RECEIVE from a user QP, user SEND and RDMA
WRITE still complete, and rping over siw works.
A reproducer is available on request.

 drivers/infiniband/sw/siw/siw_qp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/infiniband/sw/siw/siw_qp.c b/drivers/infiniband/sw/siw/siw_qp.c
index bb780e3904a2..10876cefc0bb 100644
--- a/drivers/infiniband/sw/siw/siw_qp.c
+++ b/drivers/infiniband/sw/siw/siw_qp.c
@@ -869,6 +869,12 @@ static int siw_activate_tx_from_sq(struct siw_qp *qp)
 		rv = -EINVAL;
 		goto out;
 	}
+	/* No opcode from FETCH_AND_ADD up is valid on a user SQ */
+	if (!rdma_is_kernel_res(&qp->base_qp.res) &&
+	    wqe->sqe.opcode >= SIW_OP_FETCH_AND_ADD) {
+		rv = -EINVAL;
+		goto out;
+	}
 	if (wqe->sqe.flags & SIW_WQE_INLINE) {
 		if (wqe->sqe.opcode != SIW_OP_SEND &&
 		    wqe->sqe.opcode != SIW_OP_WRITE) {

base-commit: e7732ec135b501e87ab060d992b3b5f2ec4396c9
-- 
2.43.0

