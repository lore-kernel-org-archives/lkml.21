Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953230;
	b=E2eYUFMVmFj9Cx1cpuric+3U/bOVpKhiV7wOUcoCysYw2f4WsCQ76mdWP0rux9K4dzbQ
	 iu+vhWyc7jbEj42GpWL1FUBbLB2FghIRQXmaBmk25Hn53O4kVMfdqhnVdn7NIy8K01ZQn
	 jAM9ThztT0mH4HYhZIbiR0mXUnoUOrkJ4q8TA251CeR2v0ZNcYYonRtCXiB2dGOcWSG8N
	 2xYQS6pY7jMImtd5B8Qco7JcGYg3ELH1dIv/msmscl7vM131UgF7cVH348ILQbP0ioRNT
	 NxNOSB8BdN6ov/ztysJ19Z1EhGQSQqqGDyfVDRk1uenLhzbO4AwBh4UN17n1RtEKWWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2GBjuuLx2RWaDTkuZWX477BOGa5Oz0VCn9xw/zNR/10=;
	b=3rRUmdFlnQdppYI3H7MzDGzh4F872/tRVRYr+91z1GtjptLZlawd92fIKD/BdJQX+/iZ
	 fhdDe4vphRU1D3A8+zfFE2O+ichKXXl3X1Iy3P85NShb2MeZIDiPmf28xUMKN38LMPzoK
	 27BcA31iot4xe+G6TIM/e+Mhtm3BvetdNT+XFWNUl3D0roQ+TE8HAbJJoIbhOFolBlocq
	 P5GFWHOGKBSM4lRINQsBRyb/CStqY5LU279w/cf2lPC78YlujRWhk9nrlMrkRv7/ALX4o
	 EO6NWLnqAjysiWsl/IwJm1BO8lPkSl8WTP0YVMb1ClU6E+CsRlFO1tkT50x0beNKLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YjMcTPAa;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89264606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89264606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YjMcTPAa
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so3650415e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953229; x=1795558029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GBjuuLx2RWaDTkuZWX477BOGa5Oz0VCn9xw/zNR/10=;
        b=YjMcTPAaCNLwh8YsFsR8o8tzBojZaFxao/nIUzjkmHeCAnTlRnk18p8hhIrmyoFrb0
         WY/MtG30d17cQePBcSMFTOf9TW5ckUX8s3qtayr3oPTvHhkOYgayFQeLgs2nU/NWw0hq
         rXgqZRMiPeaA+mhjiJfK9Gs9lqp8vlL/AZanTe8OEw/GQzlFe+IXt/WBGsHQm/aVqHAH
         fuO+GY3GFEDPNs1OiWvgGeQs8Z8MKNNrkZwTXxGj2sigIWdJaAzrdj+8loP05qbF257K
         kC5VCdfiH/15c4x6wJBwoRdbu9dLVd7/yED+i1EnuKg6jeP8ScbCPhPN5rjuuF9q/QEc
         WZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953229; x=1795558029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2GBjuuLx2RWaDTkuZWX477BOGa5Oz0VCn9xw/zNR/10=;
        b=dIy/23IZ4jKp/bEg466jpxouJkP1DE0my0aRCajN/qABR80FWznlbuR2cxT1Faqkaz
         Ekm8p7JBCKVpzp+jRFM+iMd9d+Vz3IfLqZF1KDxbCG1sJU/rvRK5UtPMGDl52QdsJm9R
         3fpliagnWdt1OSdbdZFD1nVwt1i4szhBIzlBIrc9JbmZC16Zwq7798I56lTAU4wkplXe
         MUNnYgZLlpjMT4LhXf5lYwv66GNoDZ7ss0NTps6N2b3iLxHW5ogxXyHqqeSaeAYeOICG
         DfRabZDHJPjQ1vJIZx9PtFrKyBC4Hn6EH8hHNd/OdvsgC/quFf9IwJlFQ02D0CBzXeYf
         ZBqw==
X-Forwarded-Encrypted: i=1; AL+hErELno4+6vllbdo45fGw6NwvxoSRdsLeCUbNAjdCNUdtLxgavhBoPARkWD/+cFNBEQoT5/yegjbePqdicxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EZbkEvZ2MBTjbAXIdgP5yUb/ykoDqhSl48k8e9MBcGXltsvBE
	eZ3uSPWDwxLF4NzKa67xqz4uazN8Q9EB9JsKJ9ykI4NvsfQ0QX6fEeU/
X-Gm-Gg: AYBFou0FAeSw4xHTZP7aXhBtsl0MG1bHHdLpOqM+mDFyq0/QObxFSl020tArwLY6NM1
	rmHaFLqXUHRmQn4o/qyFakpi5gnHeuX7/Y2N8dRbPjoQZV/iP7FxLVPVxOEc1xtQotySYqMmk5g
	bKIjLZ420XvY/6xys9LfMBOy/ZDxqQ4955d99VLxkc1j221gIFXvUGmZ51lw5d75CIpDqbMXq2l
	SM3GA2UcxeQHRqP/iBJCu/oxuvT9k8VZG9eJN4c1wyAFY5MbIHmDlcFiKH7NXWF9daPZRRgRclf
	PLqGqkBs0pe8CffBvvmqRJp5lRdIPUUf7YI5cr0y2OMaqOqGfqz8GmAWypCGvv81YAwx2Ts0l3E
	tpyPMkz2pxi9jPNQG2/ghnOrH4H5AH04DleNQZ6ZrPKih6AbNJg5RnVC6RZEhl+6dkoScXXSFGT
	IiYTawwKb9Uk79Ov3MZR7o6DYEth1HVDBq+g+YkjxuIZ84sg/Kk7ObkLHEES6emPLqqYkfq3SY8
	uNIZOKZaSszigYpV3sfXGmvp5SLlQt3kDQUHtHHzf9mDBXUQnk2Un4KfN7r49JGk4bQiWHId07A
	PBSLmxJpci6W1g6Zd+Fd5XqaW0wjqKLvkDqgkyc+85ZLZLYDjUDfze+/0gRU56/Qknhkv7d8VsE
	go5eI3Qowqsoclq/Twel70t17B4AP9UyBAXpphA==
X-Received: by 2002:a05:600c:3e19:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb7da18500mr9671815e9.12.1794953228777;
        Tue, 17 Nov 2026 14:07:08 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([41.44.127.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm15360655e9.10.2026.11.17.14.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:07:08 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-sound@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH v3] ASoC: Intel: Remove unused intel-sst.h trace header
Date: Wed, 18 Nov 2026 00:05:57 +0200
Message-ID: <20261117220558.2702-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111223102.1310-1-obabitemitope765@gmail.com>
References: <20261111223102.1310-1-obabitemitope765@gmail.com>
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

Commit 970d299b0a0a ("ASoC: Intel: Remove unused code") removed
sound/soc/intel/common/sst-dsp.c, the only file that defined
CREATE_TRACE_POINTS and included trace/events/intel-sst.h.

Nothing includes this header anymore, so none of its tracepoints are
built. Remove the unused header.

Fixes: 970d299b0a0a ("ASoC: Intel: Remove unused code")
Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Notes:
    Changes in v3:
    
    - Rebased on broonie/sound.git for-7.5, which already has the earlier sst_ipc_inbox_rdata patch applied.
    
    - Added Fixes tag.
    
    - Added Acked-by from Cezary.
    
    - Added the people from commit 970d299b0a0a to Cc.
    
    v2: https://lore.kernel.org/all/20261111223102.1310-1-obabitemitope765@gmail.com/

 include/trace/events/intel-sst.h | 148 -------------------------------
 1 file changed, 148 deletions(-)
 delete mode 100644 include/trace/events/intel-sst.h

diff --git a/include/trace/events/intel-sst.h b/include/trace/events/intel-sst.h
deleted file mode 100644
index ae7c269b0824..000000000000
--- a/include/trace/events/intel-sst.h
+++ /dev/null
@@ -1,148 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#undef TRACE_SYSTEM
-#define TRACE_SYSTEM intel-sst
-
-/*
- * The TRACE_SYSTEM_VAR defaults to TRACE_SYSTEM, but must be a
- * legitimate C variable. It is not exported to user space.
- */
-#undef TRACE_SYSTEM_VAR
-#define TRACE_SYSTEM_VAR intel_sst
-
-#if !defined(_TRACE_INTEL_SST_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _TRACE_INTEL_SST_H
-
-#include <linux/types.h>
-#include <linux/ktime.h>
-#include <linux/tracepoint.h>
-
-DECLARE_EVENT_CLASS(sst_ipc_msg,
-
-	TP_PROTO(unsigned int val),
-
-	TP_ARGS(val),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	val		)
-	),
-
-	TP_fast_assign(
-		__entry->val = val;
-	),
-
-	TP_printk("0x%8.8x", (unsigned int)__entry->val)
-);
-
-DEFINE_EVENT(sst_ipc_msg, sst_ipc_msg_tx,
-
-	TP_PROTO(unsigned int val),
-
-	TP_ARGS(val)
-
-);
-
-DEFINE_EVENT(sst_ipc_msg, sst_ipc_msg_rx,
-
-	TP_PROTO(unsigned int val),
-
-	TP_ARGS(val)
-
-);
-
-DECLARE_EVENT_CLASS(sst_ipc_mailbox,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	offset		)
-		__field(	unsigned int,	val		)
-	),
-
-	TP_fast_assign(
-		__entry->offset = offset;
-		__entry->val = val;
-	),
-
-	TP_printk(" 0x%4.4x = 0x%8.8x",
-		(unsigned int)__entry->offset, (unsigned int)__entry->val)
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_inbox_wdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_outbox_rdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_outbox_wdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DECLARE_EVENT_CLASS(sst_ipc_mailbox_info,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	size		)
-	),
-
-	TP_fast_assign(
-		__entry->size = size;
-	),
-
-	TP_printk("Mailbox bytes 0x%8.8x", (unsigned int)__entry->size)
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_inbox_read,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_inbox_write,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_outbox_read,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_outbox_write,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-#endif /* _TRACE_SST_H */
-
-/* This part must be outside protection */
-#include <trace/define_trace.h>
-- 
2.53.0

