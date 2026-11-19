Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101215;
	b=DRrTHx9xYQQVwmK9qd0ADiQvrbHNJ+b3WBfpWMOGoEP2Etet2188duIGWCE8tqDHrhPT
	 xb+6eRgAefKV7P4XGKLZpB2hW2ncileEVDxFtEjFp9OltGyCiXCswE3mntDm4iyHOyOs1
	 A2ODIqqMlmN4NECu/ZythaqEtGxAtQvblCqAosNFO3dtpnYzEiQgo8e01BRrauxxc5qxk
	 jhHwfTvxxcoZscjX/yd1yBQSSayD5oYRqVwQrMiz1CRNj6s8cqgtVucursAAMmgr6eU2s
	 +Qkd7pcVIVfPqKCApcAS5McIfADrrhRgKhF4SbRLInj+SHMquCGQSPgmrxDFwT5TFcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=unOxuddyQ8CkRU4QDdC1UIs7kvHHG3wzvhCsDgFWKqo=;
	b=yaWmlypkvNoiktW1+HJv8XDI3HTfiPM0WWyvKL34pslRl6hFarJsb+kCXlbLGnElBW9K
	 YLbjVF795pc5xZMk72dH4GBBArPx3wsJnhPQDi1Hp55wugQsYAuVSlyUGH3QaIZksh1Pj
	 +vbBJaqpMVi2hLT4OB1HtwRppRZTNVPPHJRonSJdT05QwPkLrohBqug2BPTj4C3w8L4wW
	 jMVhDou267P8VBr0ynn/QBp7C3SEq4CPJjdFn5CmzXbIe7xSghcLo7Y80rSXTkd4JwmiZ
	 8QnR6L2QcloXkBfwUq4FalHbiIDa4fgZawyKh2a33oktM0XMxRXMK84K9b4si5x8mQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dfJY0cBl;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C626606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C626606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dfJY0cBl
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53644ab1f7bso18620381cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795101214; x=1795706014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unOxuddyQ8CkRU4QDdC1UIs7kvHHG3wzvhCsDgFWKqo=;
        b=dfJY0cBlzNaKteZvUBuUIpyRrv6yr4aci12uXEBETp5AfC1XQ6kCMLwfpOvZjSw60X
         RjtoAywWYFcj4SrrgXnHkW7rhqzb7pol0qc1FQ72XWyjB7ei1xTxb/oHjKoYWXpfso3x
         lmrp9sbZjkB4f3DL/2w8w3imPop2vap2L/rfSbLYOJenytj5sBXULjYoMMkz8BY2DiwU
         8olC9UBAbsJB5Be55lfRqgQQ/gnRxqtee5u44U5Ia3LNwb8ORh2t4A0BoXyFS5W3y5NM
         c2a/OVkRaEHKzvjKd1brSCcVBQBa23QdFkeLPh5J1UhepZbzUNsLBLn0do4L0DhquJQd
         48Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101214; x=1795706014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unOxuddyQ8CkRU4QDdC1UIs7kvHHG3wzvhCsDgFWKqo=;
        b=N2qHBFaxiEvv3ByDgPXfWiGQs1ftLy/q6HSmHUCPbKR0iu47O0t3D2+2e+zNMElWgt
         FBaLmtheIG7OxhXELi1XUwJQ9dt8FZppWpjCqhRbsw+fJhoxMjQnG4AWv5SvW5+f9nGo
         7/wZmWxSBL9SLGr0sFNWyWuNHl/QxFUmnBVKIbbB2qiRSuVKFsD8Cay8btFp3JP0vBTJ
         IKosD0h7k4zI8BW+F1SiAoQeuHoYrwWwnGEjhtuSf5Tj4olkDTLfQlO2clwWEk5j809H
         pZfTJncEFeojTACYZuCfdSqHrm8tkTyRgg870xopMwEQwq6MQ5KDTk2avrbvMo8FMkRu
         evVA==
X-Forwarded-Encrypted: i=1; AL+hErF2OuJzZRWM7XvTd0W59fML4mLSvmOH5M3sgdluQ+stZ8QnAXZWhwT4pld+Wd8xzZkyWt1TqQ9xW4rnSuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D7fAEDEH4rI7TA0aCh+HAccpEb0ImDBOIVlKb2K83wqvZB8kk
	30wAf7RPskuLwrO/65RNML8UWLbhLHQyQ1eBn+obd0GlruehblEW9dKRNu2TQk+Q
X-Gm-Gg: AYBFou1FwD3ArOEhJSlufV5Hret8CjcTM7FIPTIHzirBXE//Rh1WN8kjYDq+25oFYlX
	KRzA0iuCBrJHRItisKK/CUHX+FIjo282tE4d3bHTYIDwYyQdZ4k8sKdHlr3VEuYHSX9ztoTjZys
	0U6+siz9MkhsAg8zDCZaxhOKHz6qDQfsFcydBaxcYFhPUJp/qNv5RUrpP1RrdmH1dfNad9LG7mI
	hZixwX4rXLqNCZYRAPzKcmK9SBKtu//YcXkRgFo9CC2M08eDhSh1EeRDMfh6Mllt3PwtIHFGQLn
	miq4g/ES9PPZAnLtytjeA4UYMa5sktzmVZjD6hAsi3ViTX5YoF89psuYYNr6NAVKr47bz0wIxtw
	ApcGboSWus5wD019uOuPuBWKSfQvovWmLTlb8iAQYqUBuwdqYl4quUOfKAoWnGi4LpdgyRZbmH/
	rvzUFz+61kI7t3L5KCcmqxUiPbUKJFxtP9wiZAx9N66mcGkGHa4bmp8zBJLR952BDamLbNO622M
	PJXEZVTxLUoDUg5W59GMiISYB8iPZqt8qEVdCl2n+LJhD68VWEynjXtxSD9It1/FiPIZ1DK1Fdl
	0mbteKDb0DVcliINoFiSyMIrTPl8VRYS6pCx4FYSalK9E7JQrjDGqqkjSuV9HEeb9uHYVhIuuoi
	TajjnNBSDSR/WyBbCP1MYSb85fLIw1pxpHXcwlVDnus9IfciMPIb1eo94svaU5uDUt46obhymRY
	pFrJ0ovw9KWf5/P0q0MhNWDmu+2uY=
X-Received: by 2002:a05:622a:30a:b0:536:51d2:1e44 with SMTP id d75a77b69052e-55d76a16dcfmr3245161cf.22.1795101213870;
        Thu, 19 Nov 2026 07:13:33 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c935:f347:a919:9f78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134050859sm994356d6.43.2026.11.19.07.13.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 07:13:33 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-next] RDMA/rxe: Require a responder resource for FLUSH
Date: Thu, 19 Nov 2026 10:13:32 -0500
Message-ID: <20261119151332.95466-1-astellman@stellman-greene.com>
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

process_flush() keeps its state in a responder resource from
rxe_prepare_res(), as READ and ATOMIC requests do. check_resource()
refuses those requests when max_dest_rd_atomic is 0, but it does not
check FLUSH. With max_dest_rd_atomic 0, qp->resp.resources is
ZERO_SIZE_PTR, and rxe_prepare_res() writes through it in
free_rd_atomic_resource().

A FLUSH sent to an RC QP with max_dest_rd_atomic 0 oopses the
responder:

  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  Workqueue: rxe_wq do_work
  RIP: 0010:free_rd_atomic_resource+0x15/0x50
  Call Trace:
   rxe_receiver+0x5f6e/0x9a20
   do_work+0x144/0x470

The responder task dies, and destroying the QP later warns on a timeout
in __rxe_cleanup() and then hangs.

Add RXE_FLUSH_MASK to the check, so a FLUSH gets the same Invalid
Request NAK a READ would, and the requester sees IB_WC_REM_INV_REQ_ERR.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: ea1bb00ee9a5 ("RDMA/rxe: Implement flush execution in responder side")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---

Tested in QEMU with KASAN on v7.4-rc3, and on v7.4-rc3 with the RDMA
code from rdma for-next (7404c82cbf12). The reproducer is a short
libibverbs program; I can send it off-list.

 drivers/infiniband/sw/rxe/rxe_resp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_resp.c b/drivers/infiniband/sw/rxe/rxe_resp.c
index 1b7f31737225..38b5b0c2abe3 100644
--- a/drivers/infiniband/sw/rxe/rxe_resp.c
+++ b/drivers/infiniband/sw/rxe/rxe_resp.c
@@ -340,7 +340,8 @@ static enum resp_states check_resource(struct rxe_qp *qp,
 {
 	struct rxe_srq *srq = qp->srq;
 
-	if (pkt->mask & (RXE_READ_OR_ATOMIC_MASK | RXE_ATOMIC_WRITE_MASK)) {
+	if (pkt->mask & (RXE_READ_OR_ATOMIC_MASK | RXE_ATOMIC_WRITE_MASK |
+			 RXE_FLUSH_MASK)) {
 		/* it is the requesters job to not send
 		 * too many read/atomic ops, we just
 		 * recycle the responder resource queue

base-commit: 7404c82cbf1246e0e84e2ec21834d23c26f9a8ed
-- 
2.43.0

