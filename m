Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795164496;
	b=4Keccd2iidl8omPN7F8aETf52vMql79Og7D897KzTwr7ZRDb+7Di9wKRIiJn8o9GdYvE
	 Q12yLjcIPIysRoaP4arW4p/xcWruMeZs9HLPxFG8pEhTeoAgj/l7IZKPCQPk6s9OchYyw
	 +U031ul6nxphXnqX1AvqGzu6STxhcj9xMJrYHyUGPIWqfB5qTcHHfluTAawJ71hbLaY8J
	 qD88jb9i2qIqHXbB0S1n8yrTPvK3/qJ4jBcyEvYyKRGlUUk75AeGb9DMs+5HEQqrM0NcN
	 E7+EjZile6Bj0yObbxQOarBjiticQg0VT/K95AiK3Vsrm8uTutzfZJ3Yag69nCZgUYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
	b=chhQ6ImK4Z0yoNitjI4U/ia/N6vZcuxum2lMoowyURPEfuxpRhOyjn0lYfvQCmCJHabu
	 2fWMquetySz/cPnvFNYnfbFFfk5IIts8KfMxwz5+pLYytsgwXfl6ARiVQEUV5N1KtCi3q
	 SDSYlMkzpft/yFlNSYL+6Py4KNbI/USMzpF1VEMVloEpVmoXOfQeZMbee/s3FGoTmvahh
	 qNvzVbC/uKgf8seWh5bvSzeCD2jQJYtP0k2Rx/qrM9JSmR6wok00WCXnQ1q7ug1hVJx6s
	 cUIEqxSR/x7bD7+Ll1VC0EkrAvI+sUjmjTnv5UMd50KBsZVU0zMWjTi8l+VPRLaPevQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWmS09Be;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A1606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A0A1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWmS09Be
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67be1e468a8so673792d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795164495; cv=none;
        d=google.com; s=arc-20260327;
        b=BbU/+d2UFdvfrRaiNrfsdeNb1RQLQ8xlRlGU4KLIw0IF7yeZACbMWn+6QxC2fqlDVV
         OEUMZ1XT0vEEIO01yvSN598OkvRLTtGn52NHtpfoms3qok+RzSrjBaiHykczo+gHYCsq
         BEjM44L1UrVzW7ZYR23QKzH9FzbmISPqFFShmgtK+jAIwblsYIF+YUNcrx73mMOTbnNn
         2pxbV7SNLBUBJQwh3KgBbwAasOv20I5TFIucNpuIjie8qTzgnYfn9I7lH1LR7xcoWjm/
         JgfUqRkEXr438fLWUTOCGROLtIpJKjudni9DfwOsOqR5MhrIu2aFlBvPwliL0zgKAtnc
         QxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
        fh=fgfG4f8NzBv83oaKRozpbPL2FXSQ/VKxeR70GRxNacM=;
        b=UrbMSuD8BWIo7YV4MDxCwmHXoHHmGu6/8l7etclJHLe867T/juGF7B61qyaglILkKL
         W/BFyxmN1pKNWieBHhhO6jr7Gl6QYlz4Nt5MhpVXfXdjDyCLmdNdfYP3UEQQlBezS2oM
         YLkBsYiiCpk85sf1LZgJmqHO91a2O6/kCjea9XSwTtgNYYnBKUPsuoz0tBp7tNbZVQxl
         KZ0Y6NvxhLC9uFpJg7XUTrGwIXLefhPh7+xWtSaelKWeRUNHhtFG18rJKmERsxvUdNef
         6Eur9SEKLypBpE2WVrBEZrW/9dbxWTYUh1oIX+sZ/k+9SKnLC8Y6OTzedS/wJKC+Zi25
         bDxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164495; x=1795769295; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
        b=CWmS09BeEMgCYXfV6FSNZi088ryEUO7i+CoKc8quODE6jVhEin1YTPQWY/vZ9AJGVJ
         3BTcL2ThPTZCn2lcFathF7hp6wCRTGC6CKMmdrJRcPc9ssc8q/ejs+ol25rJ73lMAopC
         kWKDB1ex6ZxH7XeCTFIf0MwyHFov97s5WIUjC4vLofTYTf6lOKdAxv0vfi4K1XSARlQq
         s03ccCpfqvlQq2E8+R+vOBwYYNinlkBvCw1lxx1P8mAxhBPSjEn2drLpjR2dpEnOSLwT
         cOZNLRWLeh6QR8h/PosdNZfH1SWeIHSFpg5vynx46ZG/pCXZFxbvZiPdHpHnaTs0UiWM
         FbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164495; x=1795769295;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
        b=LgS8PAnsHCCX5NuD2SZflhksdiiixl+cgjSpsV5vsPYOnq5xVDl2TiJ+hceUgQfPMO
         slm5kit5Za89um0flMC8SLBkJnWEivDbb5eka0sdU47ZR9rMF1Ux/ioBJ6SS2wEe7BhB
         a7N55UEmtIFTwoVTItVTtznOyPAIySttM5pOuNqbyN1Pb9KV7xdH8cVK+kJhS24O2so6
         a1TKExhu8Yjd9d/RBloZiUehAO98bljKXKV7QiwBXwBdC9DnO/L3L3jIpoSHV0YXo6Az
         pdLAMtgWlHAl9tJbiVsv24UuQcQ2YSRhn8ofowsyYlV88pjzY+Xo2H513eqsgrOZvBTi
         FLzQ==
X-Forwarded-Encrypted: i=1; AL+hErG0nCDgfshXza8wmvanfs1nOBQPD0uVf/Yu4h+uk+XzHOOVcSHTqFzoe9RsZJ463HGMiTgNWfeaHhY60aE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IpMmdqkkAKqf1woCAm74BrVIye008jg4U+zRVrIvstWNiEXRg
	1VHw8eEcdx8+KOVOEar5NX0FPP6GmB07a3K9xZBY3jSm/pE7l0IlDwuuYveC3g862BFq/qBKRoC
	x6BVoPTuceHgya3pep2kxb5O3O6PRgbX/kg==
X-Gm-Gg: AZFdTZeAtoXXu4WPExuKlG04f/tY2AboIyTaLOk5bKm+8qpg5/a27n2Ni5RPo1SXqNS
	w1dappXuIRrYBY1dQaZ9b0sYdkHoYRy8iDBa6lYJIlWXWVKUdv3q7bqDDD1LOOOEKbl+46bSQDB
	rqmJDLnoOKVx//n/A/njiXHbcdAaVSmtN4ekhV0IwSmmzzeDIveLntFb8NrUFGUNZCZpAfZkxQr
	cehbpWR7EXZSdCgQ6Wiz8jbwc1CJtl2kTLEUMnN9/vLFBEILoSLJ7PCPeGqPMweoWRaCW6gs/86
	99bxaCiQn8I12bxIbmE1826sQixb3hNUMJzXlNDDFhQvF9k37RvVpUmtHVWbgL+CQlkEhdJQWTV
	52e3NkQEXKPRjgA+GpvUCWaw5kmi7+DE/RCyu
X-Received: by 2002:a05:690e:134a:b0:67d:c588:e563 with SMTP id
 956f58d0204a3-67df43ce393mr1241950d50.23.1795164495031; Fri, 20 Nov 2026
 00:48:15 -0800 (PST)
Received: from 16659893159 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 20 Nov 2026 00:48:14 -0800
From: Steve Meek <stevemeek82@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 00:48:14 -0800
X-Gm-Features: Aa3M54o4Xn00jWrzGntZB2_JEfjGjvq32pmj2DjG_uE_x2Fy5EbZhNSqDP66XzE
Message-ID: <CAPzME4aUpO4foxtL7PpaHk=7dyz-qo1vxrbw=o=qEENEVj=Zqg@mail.gmail.com>
Subject: [PATCH RESEND] bus: mhi: host: pci_generic: Disable doorbell burst
 mode for Quectel RM500Q-AE
To: Manivannan Sadhasivam <mani@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With burst mode enabled on the IP_HW0_MBIM hardware channels, the
RM500Q-AE downlink stops under sustained multi-stream load. The MHI
state stays M0 and uplink keeps working, but the downlink event ring
stops interrupting, and after a while the MBIM control channel times
out as well. Only a reboot recovers it.

At the stall, the last doorbell the host rang on channel 101 covered a
single buffer. The host then refilled the ring without ringing again,
as db_mode had been cleared, and the device never signalled doorbell
mode again, so it never saw the new buffers. Writing the channel 101
doorbell by hand with the current ring write pointer restores the
downlink immediately.

It is load dependent: it reproduces within a 25 second 16-stream TCP
download when the wwan0 receive work runs on the same CPU as the
modem's MSI, and was not seen with that work moved to another CPU.
PCIe runtime PM is not involved, as it reproduces with PCIe port PM
disabled.

Give the RM500Q-AE its own channel table with burst mode disabled on
the two hardware channels, so the host rings the doorbell on every
transfer. Other modems sharing the em1xx table are left unchanged.

Tested on a Xunison Exigo Hub D50 5G (IPQ5018, RM500Q-AE firmware
RM500QAEAAR13A03M4G, 6.18 with this driver): with the receive work on
the modem's CPU at up to 100% load, about 200 seconds of multi-stream
downloads at up to 135 Mbps, no stall and no MHI errors, where the
unpatched driver stalled within the first 25 second run.

Fixes: f6985f512f82 ("bus: mhi: host: pci_generic: Add Quectel
RM500Q-AE support")
Assisted-by: LLM
Signed-off-by: Steve Meek <stevemeek82@gmail.com>
---
Hi Mani,

Resending as I haven't heard anything since 13 Oct. No changes, and it
still applies cleanly to mainline.

A follow-up to the RM500Q-AE support you applied on 11 Oct. Under heavy
multi-stream download the modem's downlink stalls with burst mode on,
and a manual doorbell write on channel 101 brings it straight back, so
this turns burst mode off for the RM500Q-AE's two hardware channels
only.

The stall looks like a lost doorbell-mode handshake rather than
anything board-specific, so it may affect other modems on the shared
em1xx table under the same load. I've only got the RM500Q-AE to test
on, so I've kept the change to that device. If you'd rather it were
fixed in the core, I'm happy to send the traces from the stall.
---
 drivers/bus/mhi/host/pci_generic.c | 49 +++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -470,10 +470,57 @@ static const struct mhi_pci_dev_info mhi
 	.sideband_wake = true,
 };

+/*
+ * The RM500Q-AE stalls its downlink when the host refills the hardware
+ * channel in burst mode: the last doorbell covers one buffer, the host
+ * then queues the rest without ringing, and the device never signals
+ * doorbell mode again. Ring the doorbell on every transfer instead.
+ */
+#define MHI_CHANNEL_CONFIG_HW_NOBRST(ch_num, ch_name, el_count, ev_ring, d) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = d,				\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}
+
+static const struct mhi_channel_config mhi_quectel_rm500q_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_NOBRST(100, "IP_HW0_MBIM", 128, 2, DMA_TO_DEVICE),
+	MHI_CHANNEL_CONFIG_HW_NOBRST(101, "IP_HW0_MBIM", 128, 3, DMA_FROM_DEVICE),
+};
+
+static const struct mhi_controller_config modem_quectel_rm500q_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_quectel_rm500q_channels),
+	.ch_cfg = mhi_quectel_rm500q_channels,
+	.num_events = ARRAY_SIZE(mhi_quectel_em1xx_events),
+	.event_cfg = mhi_quectel_em1xx_events,
+};
+
 static const struct mhi_pci_dev_info mhi_quectel_rm500q_info = {
 	.name = "quectel-rm500q",
 	.edl = "qcom/sdx55m/edl.mbn",
-	.config = &modem_quectel_em1xx_config,
+	.config = &modem_quectel_rm500q_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.mru_default = 32768,
