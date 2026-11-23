Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442788;
	b=4eQLyPEtsLQKPlW+fYoBzGzvnkxKP4WbyQmqIcKDnn3rAkdV1AT+vJd/xesQSBdlDCSp
	 6N+XGlz2AJcYpNleugVl9z7pw0nqzcHiYerPbNDjAjKvq6dSXWgqtIzt3fs8elEK889sQ
	 rCPN3KP82hP7x7515FcXV6I7l4bZ4zdow27VW4f3I9MuD8C1SAzHEa3GRR58tG6E3+f9v
	 jXQdR15Q0dP0b9KLa3TOl2Cv1dT8tnQxpTzWcZYj3ADmOD/RGlrxFJsB2i2E9iBiNXkTZ
	 JlOU+hv3oXWpumKUml7b7FG6thhpbGkGcrQBJUbInudRq9mLF10OaxCxUJdPIVEctYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu5wY55r6MxEDWtvWV/v9nM7+LfCe+RWbKpq2oatC5w=;
	b=eHad4tckc1/S3Iaf6eXCUVqKdvVdlYzw7diJ/UJfO00swKI2uPp4HuhYWWeS9PVv0bha
	 J+T4Xk/l0+1l0bTR/HZ86xOOF1VBogpMkqtgp8mEV5+r36Xfi+Asfv2zsy6AdZBZHy3LN
	 5hbdt6/9VyU/XLZGmun4MtOyQ8FP24+Q7cVcOJa/o7ZgndzZdzSeqeCh5/L+bLftUFHJY
	 g+d3bXfga9qC+OgTd7AQwdKSYnSkgPmJZPYUlXUmsg/aqqz12nEDpxyoMfuxFLy+AjWZg
	 1GYf7HBF5JwsJMb/hOoRlOIsdfbVp/72DAWA6djWF7YdpOvqxHtq0J5IBgSUJCJeVdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OAaxT1Ha;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AAE606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AAE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OAaxT1Ha
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55c5b6584ceso25577021cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442787; x=1796047587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bu5wY55r6MxEDWtvWV/v9nM7+LfCe+RWbKpq2oatC5w=;
        b=OAaxT1HapvnkRFx8BdOhkETfVDa2kMX0iasWTpYBdgmsIC1o5rMUNXeUdcCyHH4nT/
         XqUcDDSu6VsK97gfoURNIXaNN0tmEMcIHLZ22qxJICETJHi2BCHaZCdpglqrnayxDlei
         YBr20RknzY5kscvp9qgJHTzXfPYaMWkRTzprLMIboGhpdcghtm85IvHyUj2YSorzIerm
         OqNedr/UVCQXoa5OpSbUvPT/BhdjqnonmLTYop98TGByW3DBfWhi1eaoPzvsIHAtYg4/
         oy5O4hNSSjvkCkUHH0zOcgxL3rX/+OJGyGpyTMx+S+Nbt9m6bteMLNkLULUjDDpHNidG
         iFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442787; x=1796047587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu5wY55r6MxEDWtvWV/v9nM7+LfCe+RWbKpq2oatC5w=;
        b=JDzgVs4L4ABkt6Stm2dG3PEdkTSuBG8MM+VDBZqfDizZfMz0RsERSCQBOw0tVF7wog
         3X30G0cEP0VjZIS6S15Vr1bCShdS9qRDIFHMxFWOegCythEtr+6XBSLf/EHolzSmllR+
         mUriQg0X08RkWEosZbouWa0Wizky5acwLpHiHw7PKJv+pnjvG799LAcSGRvlh35bp8rr
         mZP+jtzcmd84vutX1L6rmxsCCMA0sUc4+/TB4/pmRQcaytcZsbm7ROmL5h70+IS7Z0E0
         2DN8BhtYo86A+NH7dwge2ujqsW1piIF/ljfFsZqrZLb+DL0fLeauTYRSK7L7yE1lbwab
         JaoQ==
X-Forwarded-Encrypted: i=1; AL+hErECASD1U+LTEzy3zliPTGBcnysL+eRRp+qpZ/rFPsxeTMM3X3clxwLmPeyJrxuGLPzHZdxa5wX02/JLc00=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sVWuwT3lSfQB6YwdO7R10NWjXMZgUSfl8HYbNkCwNxnAGKwYu
	RqJF6bMYFSEnozYQIsiuuknk9yUk2AtjYQdLbGUQpdwpC8hcqR0jBMMs
X-Gm-Gg: AZFdTZcq6nwsu8XoLSAd4/M7yWIL+IDzoN5Noa6FuCbmUlewSCi4m+UWuR5YW+5awej
	DRHalBsEy8gO0mY70BZ4iKtvqgzQ6qV9PGQA6rER0EhzdH5Snt1TAzRddd6lD5PEoM8oyFuKoVe
	fhpzTwKeWC2v7Mo+gNvV5yrmrhdVqkY45AFPW4amilDbJumKoYZgpHOOT/no76b2nRkuY47K7Xf
	Ihh71qE5nDfEIxwW6t3anVQwrO3RaUy2bc2bQnPexPwfadyK0FJKgCx0qVe+5Upji6B9mRnifYW
	33+9ITI9ehCi9lZ2fmowRY9NOMZvTMQbT2BSgW38EKNCuTHShYj42W/AwFD7OAJm2HHMDAGwg8U
	ssvrGYHOtCQNTU7nrVgDdQRdFd5waEAvGSnLM1eQyh0S96tiXuTx3ZRCcCZVMDH9LqPuMKDupGn
	K/HgJnKpLZ/8qpeNM/5yLKj70P3qqihHieGiFzTl6+cLcB7QGzehlXgPtFaDwfwz4MRRisIRTVB
	nkxLVXIr49jBhsorY2hsWTTi/MW8dCi4EOy4zCHkEkVSQhqeTrLusxTM7aj+9vWbMRc8zYgieI6
	Ex7+oPaFA2Ahu0/POifLNeXTD6DESjmZQyLGPflt/ufRWpGYdmOV/pmrXWztXYcEeupUw7qdR91
	rNXSwn9w7Tq5qxS0eXNEAHglH2o4mnaZ2Iqd0rZa3ggRo96R12RO+RSOtU1C4YbE/Nn7pdQJP5x
	EQIPOzNkoxvGho4J/m+nMZtFT89Dg=
X-Received: by 2002:a05:6214:1d27:b0:91e:8e90:90af with SMTP id 6a1803df08f44-92134987eb9mr224158296d6.1.1795442786561;
        Mon, 23 Nov 2026 06:06:26 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c1e4:47d6:99db:6f6c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b0b10sm107672366d6.10.2026.11.23.06.06.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:06:26 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Xiao Yang <yangx.jy@fujitsu.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc] RDMA/rxe: Fail ATOMIC_WRITE WQEs whose length is not 8 bytes
Date: Mon, 23 Nov 2026 09:06:25 -0500
Message-ID: <20261123140625.64448-1-astellman@stellman-greene.com>
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

For IB_WR_ATOMIC_WRITE, rxe_requester() uses wqe->dma.resid as the
payload length and finish_packet() copies that many bytes (up to the
path MTU) from wqe->dma.atomic_wr, which holds 8 bytes. For a user QP,
resid is written by userspace in the mmap'd send ring and is not
checked.

On x86_64 v7.4-rc3 under QEMU with KASAN, an unprivileged user wrote
an ATOMIC_WRITE WQE with resid 1024 into the last send ring slot of an
RC QP. KASAN reported a vmalloc-out-of-bounds read of size 1024 in
rxe_requester(). With resid 64 and 1024 in another slot, a test-only
printk in the responder showed packets of 64 and 1024 bytes, including
bytes I had placed after the value in the slot. The sender's completion
was IB_WC_REM_INV_REQ_ERR. With resid 8 the write succeeded.

The responder already rejects an ATOMIC_WRITE whose length is not 8.
Make the requester fail such a WQE with IB_WC_LOC_QP_OP_ERR before
building the packet. With this patch, resid 64 and 1024 (in another
slot and in the last slot) completed with IB_WC_WR_FLUSH_ERR instead of
IB_WC_REM_INV_REQ_ERR, resid 4 also completed with IB_WC_WR_FLUSH_ERR,
KASAN reported nothing, and resid 8 still succeeded.

The issue was found by Claude Opus 5.5 running Quality Playbook, an LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with Claude Sonnet 5.5 and reviewed by me.

Fixes: abb633cf2804 ("RDMA/rxe: Make requester support atomic write on RC service")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
A reproducer is available on request.

 drivers/infiniband/sw/rxe/rxe_req.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/infiniband/sw/rxe/rxe_req.c b/drivers/infiniband/sw/rxe/rxe_req.c
index 4f353abd7..bc3d5cae5 100644
--- a/drivers/infiniband/sw/rxe/rxe_req.c
+++ b/drivers/infiniband/sw/rxe/rxe_req.c
@@ -766,6 +766,11 @@ int rxe_requester(struct rxe_qp *qp)
 	mtu = get_mtu(qp);
 	payload = (mask & (RXE_WRITE_OR_SEND_MASK | RXE_ATOMIC_WRITE_MASK)) ?
 			wqe->dma.resid : 0;
+	/* use the local copies: a user QP's WQE can change under us */
+	if ((mask & RXE_ATOMIC_WRITE_MASK) && payload != sizeof(u64)) {
+		wqe->status = IB_WC_LOC_QP_OP_ERR;
+		goto err;
+	}
 	if (payload > mtu) {
 		if (qp_type(qp) == IB_QPT_UD) {
 			/* C10-93.1.1: If the total sum of all the buffer lengths specified for a
-- 
2.43.0

