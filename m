Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195728;
	b=I5egOuxFrZ1q6WaSQiCrK1qqk2/CLPtor/kvF/rmAMTkqPp1wi7NbbzMHY5ilW1BDhLC
	 LySVZXB/OnCw9YWi4bP1vOQIHHZ5H3kqUlR2FUxaLpby7nlAf3D9pRpi7ZfcojFxvFfzJ
	 3KmAOEhi3grt8ACbhfy9ZJiruvA75LS2xdhUHY0ajTkPbCCCX/Eh2Tvm5C20KaSEGgRga
	 ZAp4kaDqcrgNyEt9azzsPtn91B3HcrScrihIIKtHjiREA+f48pI+5hiFgysP709mbx/Cw
	 SorRYH6qEiaPA/h+djkjP146gwm80APyjq3U65LGU155cev5w3AwGoPxtsW2QAmamJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xxYJksBoX0oLarGiBWELphq92MylUpFS9PsbMM1zZeE=;
	b=cypY530a06tqkeJvT+9q/Z3fO16yMlJVHdl+YRNTzClrzySX3yyvwN0vH9fJk91DuCx6
	 o/8qr9aNu3Dr8f/2pP4/BkDW8ZQErlKGx1OFyCuJNnJbkPCrr569FM0TzTGn0bUQDXrGq
	 dIA9WIJ0B4uevtfW/bYS/esVe8CSBTyaLujDtQmUXYq/drx0erMlu1N1l8LOrnVmudLcF
	 LPSIOlMSYuYUjN0jotxV4co9P04ueFW9iIspfLhTZXhFnurSgn2HvTm5mFP1oP8+709t+
	 yxxT7zF1k4jXlqwizAfZMgCd779IUh9wBhsvTfvMDxn581xjfVv7h7H0m2pZUAoOPsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Z5jqe+ct;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0E9606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0E9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Z5jqe+ct
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b6b22be970so535769b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195727; x=1795800527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxYJksBoX0oLarGiBWELphq92MylUpFS9PsbMM1zZeE=;
        b=Z5jqe+ct7rqVEZunLyzcRBFtUcB1PaPmFayXQj80bxlnQ7nuLHz1OnJcJ9g/Aure4R
         FaAwLsrx8PBE2Jxv/2G945qIWvKjujkadkVip6lw+QDi59Tv8zklpOtm88hYJewmggn4
         glxT42F3oomoyu4zhx9fkoHRhUPmEBYE/szYJYz6ByUHqvjn0PlRLKy3GespQy1Nbubd
         3+Bgq3kKEMg+2r+KY//L27oak23aliNCMY80QJs4T4YvGguFKweFrQzs4/iMdvCxvhjJ
         RG8VZqk7+IIFZUQMsw9uCaDhmB+Z1F1NeYsgHfy9erJMOPOlgALht/KD9sluBxjeFXE8
         iLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195727; x=1795800527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxYJksBoX0oLarGiBWELphq92MylUpFS9PsbMM1zZeE=;
        b=s7lJxlNNPvpabOPVTO/LObYJOzFE+eUrCBoa7jKxmBby9zW1LoX0VM8OOA8NM358OS
         fZ+rwQDHFCM48UJATyeztPzcebg2SnZf2K1G+tpEJ8I2nsqDznAAI+bBBcKQY5L9uM2N
         dChJ22y4KjEEWcEPkwW9pSIMM98xu+QPTUF/U8zOY9mIe+woda2DOfDbL+DL1Vqp0WXK
         /buNWIpBTdRdEEg05LDNxuM6HwHWj0W8HqzMXbqmzCCMpSDwE9ttyaPIZ0q6GTH7a7EJ
         HpU492dJxqu09fwsQW/FQXNnkh1vCT3USOq92MZcODmoFmQwH6V/9phy+t3H76Sa+3Ur
         OH1Q==
X-Forwarded-Encrypted: i=1; AL+hErEdLptq2oAyTCHIu51LXhRRXtIFYSnw0VKTuydc66zsfrX3NOtLXQS+Z1R7PuXGngxHRJ1DceKgNA40ccg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uIdp1rcNBokM6RNogHF0SNp0JGeaY6ao2KmbDz+IU59nUaHUN
	vFxPVimftWUv44UWxwaLk5PNNCi88qp34LHYwdOYRrKoJhWvyX4vraxG0leRaBJfHQ0=
X-Gm-Gg: AYBFou0B0ewJP8EFyj4g8XDqwafl4HsI6VHGQi4JED9CREDdTlIB6PnwNlv1h0fC3pq
	0FPBGNYPjmfzsGbqZI6lv36G2HAyIiB9Jz/7pLGKWtktiQ0bLJEYzHlEU+RcJCBN/rysg+93ip4
	VH8Ok3cdBW45hR9fPnpv+gGqVINTo9YQpaqiTxTp7DKWMsosB/i2XMrBuYs0NWDgRTqipxdUZ/0
	/Gh3h+WQBJopfdxS4PJmKqJkbsguX15+nfXSAweZ6qhzsBN960RhS9Que6RTF2/jt4EFvWT4Oq6
	Vg2XZ9lYPfmvonuckhFmau/gRomtDrIMjIldDiCD2PnsqHxiWj+O5SY/wdJ61UfDfRSbsTgDsQR
	16PzPF+mPc7wv1FTWOyTaGeFN95p6/9cjR5ZEN6L+5Plu4MdlD7nK7FLhUdTf/B5UVfqPMk4ZRA
	B9JCQWeklDSyGjrWxVjRqO2XS59bUdx5VAaZvFwFhJJW7y+yMGMah+BcCKPQTd+PCzEI2VelEnd
	aStI/hfDY8FL7mvy+8ebZlQOZ+ClbMM2eMQKA6JBrQTJD4j6n+rdm8cgFFQy6FOQtPs0K/Nq9ZA
	rcu+/i/HKofGoRosKu9ft8qzOTjXBrSeQ9ZdoysPliSy5J7KGzgoDE1ftPK6apoG3r3Q/10QFRH
	nQYz0mAHqAhxUjzJeH+eg8i6XhLuLYyG780iCyg==
X-Received: by 2002:a05:6a00:1989:b0:8b5:a9e0:3050 with SMTP id d2e1a72fcca58-8c8792c35e6mr4133537b3a.2.1795195726843;
        Fri, 20 Nov 2026 09:28:46 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm1867911b3a.33.2026.11.20.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:28:46 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v9 1/3] usb: gadget: f_tcm: zero the CBW buffer the status path sends
Date: Sat, 21 Nov 2026 02:28:27 +0900
Message-ID: <20261120172829.3286180-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
References: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
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

bot_prepare_reqs() allocates fu->cmd[0].buf with kmalloc(), one endpoint
maxpacket in size, and the only thing ever written into it is the 31-byte
CBW the host sends.  The rest is never initialised.

When a command is rejected before its data stage, bot_send_bad_status()
points the status request at that same buffer and queues it to the IN
endpoint for a read, and bot_err_compl() re-queues it until the length the
host declared in the CBW is satisfied.  So the host gets the buffer's
contents back, a maxpacket at a time, for as long a transfer as it asked
for, and whatever lies past the CBW it never wrote.

Allocate it with kzalloc().

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v9: move the credit line and the Link out of the changelog (Greg).

The same change was part of Hui Peng's multi-driver patch of 2026-09-19,
which was asked to be split per driver and was not applied:

  https://lore.kernel.org/all/20260919223521.3890508-1-benquike@gmail.com/

On a dummy_hcd gadget with a 512-byte bulk maxpacket, a rejected IN
command declaring 4096 bytes returns 4096 bytes to the host, of which 72
are non-zero and begin with the previous CBW's "USBC" signature.  The part
no CBW ever writes read back as zero there, both before and after this
patch, so what that buffer held beforehand was not observed; what the test
does show is that the host is handed a buffer it only ever wrote 31 bytes
of.

 drivers/usb/gadget/function/f_tcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 3af28419a8bca9..22e57f14e938e7 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -330,7 +330,7 @@ static int bot_prepare_reqs(struct f_uas *fu)
 	fu->bot_status.req->complete = bot_status_complete;
 	fu->bot_status.csw.Signature = cpu_to_le32(US_BULK_CS_SIGN);
 
-	fu->cmd[0].buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
+	fu->cmd[0].buf = kzalloc(fu->ep_out->maxpacket, GFP_KERNEL);
 	if (!fu->cmd[0].buf)
 		goto err_buf;
 
-- 
2.43.0

