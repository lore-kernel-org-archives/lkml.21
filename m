Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049561;
	b=Jbnr9xkHZZlHUBUOc/PwrNrP1lYjbGcNxRXg0tzxI7sP9GuupBlnM+qbV7MtlkeOb6cm
	 B/geNBPmJhoR5iU3UdJvRJ8ftEy8hruP9M68lgihr6kc+PW9nCmoXDZKqw3+ZghzYpLbN
	 38W6DoH0ucuzwWHphQTxCiNpk6FbmMgP3s0hL3LQt2KHxeDJ5SFw39oreFCw60rVtTqIz
	 7uz+o3la021TPIJX1wOWuOiJvZAaqHMdY1awftDYCb9q4mYzvXSEXheL7Bo/aiNT8lep2
	 jfT+iNE79DM+WyiWWeB9Rxy5H9s/rN2Xg4AFv5l8U+HOEKH/wispL+/GKI7W+FdlJLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nymuC/5fpi5YK3jj3hRmkBJgLlOLdb1iU6gNf70BLcg=;
	b=zve2AEFJ2xAMSyBIYoFbYluQjxwh/Ax1MbCUtrjtc93UfQlnTCz3nGHsA2Dry8n+aw/n
	 9ohfldTPvtxk9agAFzUDbD3sVnENIGP986ZL5OQF8UhtTCocffa2Vikmd1UIRlGmRJQkL
	 PyKGCTpjC/P+lYnPvhhhup/MZX9XaA1NcYw66OU7Yitu5k20vICR7kdc/hgkHbM6yNbCQ
	 isZIbAtQnNOkCWSsarTL6w5NISJPbsZJHecLrhzjMiz2hVtIXHjthB41u8qzR0c40cgl+
	 H3S7fWt0pxsXnxZR0DAGHQaH2JWN86CIzg7IQ+XyxZDwxM4/V7TL/8LQJ8nqLg0LrBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Iq316Y0b;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92B0606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E92B0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Iq316Y0b
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9495c633eb5so111499085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795049560; x=1795654360; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nymuC/5fpi5YK3jj3hRmkBJgLlOLdb1iU6gNf70BLcg=;
        b=Iq316Y0bGlG+Icqd6RlOOuDf9DVXgglC1lbVWj5XkNFRNyBPF0VU2Uk4yLsX227t/i
         30m+0cYjgW3Y5k4GdEpqgt9couiCwmgqE0Lrzq28r51Kex8/sfBmFgIvurFE/DtaY2AC
         cHTcwZIhaSvTfS30bI8NeudaJ7MLk7bQXl+Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049560; x=1795654360;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nymuC/5fpi5YK3jj3hRmkBJgLlOLdb1iU6gNf70BLcg=;
        b=I/iZiC//w9o9JL+YMX+DdJkV+E8SLjbH8R44NZjUVgnHm8maUtCSrkvzPItrPb/GYj
         W5hdLP0NlmvBC9/CB+CBC1ez9bdQrz/6moUdjbkro4PO2Y+MSmCm73bl/CosoBCCkwD9
         Fr+4mYOpV1OTkzkYgLqFAaudQrkywvQxcyeCuzAD83/ND4gorRxIMktNJJJgXV0N0uMG
         rM2qnBzoQLH5o1sHDSBOcOCUzUSAIQDoH4oPH1V/bng0W7eszQAA/4FBJy6pkEu0Pqi2
         t/9f/tFbuvKpQSFBU08p70mJMK+wFUJNYnJN32bhcMiaRidfIS7+Q835tDvKQwEHdGH0
         SXCQ==
X-Forwarded-Encrypted: i=1; AL+hErF1oPvHtqLPZf/HKtSVP3QfUYFTy0XU1p98DtYaowNarse//AezDZ0QL6WKd3YA6O+lxajHm46ybP7jF3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F6/JwwZT7tAE9fKAQMUQTZ+SEV+VUv1Ns4muHe0PiOdXHt6NI
	tNUHp/IOPURWd4RHJlXX5ZbvOzw5CCh9F/6hDKc2h6dYY1ZWg6FsMA/K7ZsRo27XDboinqFaKhj
	89LbgFA==
X-Gm-Gg: AYBFou2P3MTE8qIcuZWXwA2w0cxRl+GesQIWvV/rSf+eAPj1+vZD2XSmpgLu7QCyx2f
	f+B6qP+ZkKnxnV+JOlKD2xSMd8WXHslBWEsv9iZoKSLLC5VDF6gYiDmjiHXtnCXVSbYMPdJcp+w
	i2gxk0PJYDUnOuIbV2rquFMHUlr2vSFY18oTE7VmEr1NDx4L2XnImJmtYGXtCmsJdkEGaroG7O3
	Gy/Zy3GUu09U2C1hxnlWbuTOnxGUd6m2/A+UgvYZgLnxqQRgzMSqJ409OvhvthRtitPNfZECz/k
	zmkCwtb0+7OeQ40qE16OK4R3G84mb/LJg/pDfQN3F6FA0c1odNXWY0LvcixIc+cr3E3B0liuZts
	0ThtsZAqpKcapdppck1+IOvMnI3UBjHvRDYkpa6+BtiNtEBvTY2bBrtKcw6YbMqalhbal5zBFU5
	iK8wSQNsc3qTCyzVRD32oWkp9c56RG7SylZ4u4QyTMhPYvr8JybV/g9p6UsI3pHcJqSr4VqKVLP
	sQpQ1gcoBfyllx4KY8Or8mHV/wDEqJHjPL7eJYW7FAKiRAC0LcDx6gEPtnPHttBkXGlqV7+43cV
	u8iStg7lrAPdDRaiPSamEeBmVvHjbUoCvjQ9fKGwK5PPvMCkNQjBw/7wMQsjWXcjA79jC1sMPJJ
	jarrUc7FPQ80=
X-Received: by 2002:a05:620a:2586:b0:943:e946:8c6d with SMTP id af79cd13be357-94999667470mr875646085a.72.1795049559815;
        Wed, 18 Nov 2026 16:52:39 -0800 (PST)
Received: from ripwilburliny3.c.googlers.com (128.5.86.34.bc.googleusercontent.com. [34.86.5.128])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b818399sm308860785a.42.2026.11.18.16.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:52:39 -0800 (PST)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Thu, 19 Nov 2026 00:52:19 +0000
Subject: [PATCH] PCI: Override Intel Apollo Lake audio class on Gauteng W3S
 laptops [8086:5a98]
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gauteng-audio-class-set-v1-1-e81d6fd620ad@chromium.org>
X-B4-Tracking: v=1; b=H4sIAEJI/moC/yXMwQrCMAyA4VcZORswVSvzVcRD1mU1Ip00rQhj7
 76qx+/w/wuYZBWDS7dAlreazqmBdh2EO6coqGMzuL3zRNRj5FokReQ66ozhyWZoUtCd/HT2fWA
 6HKHVryyTfn7n6+1vq8NDQvnuYF03yQyccnsAAAA=
X-Change-ID: 20261119-gauteng-audio-class-set-256f769ca134
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Steven 'Steve' Kendall <skend@chromium.org>
X-Mailer: b4 0.15.2

Gauteng Education Dept MODEL-W3S laptops advertise PCI class 0x040300
to use the legacy HDA driver rather than the Audio DSP on the Intel
Apollo Lake audio controller ([8086:5a98]). However, this board uses an
I2S ES8336 codec with no analog HDA codec, and its firmware otherwise
sets up the hardware to enable the DSP.

Add a PCI header fixup for [8086:5a98] on Gauteng W3S systems to
override class 0x040300 to 0x040100 so the SOF driver can claim the
device. Notably this fixes the internal speakers and headphones but
not jack detection.

This patch and its initial changelog were generated by Gemini during
an interactive debugging session given dmesg, lspci and similar
dumps from Gauteng W3S and MODEL-W3S laptops. The resulting quirk
was reviewed and tested on physical MODEL-W3S hardware and on a W3S
with slightly different hardware.

Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
---
 drivers/pci/quirks.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 7f1f47ea2ee4..908d038fa29a 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -754,6 +754,40 @@ DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_VENDOR_ID_SYNOPSYS, PCI_ANY_ID,
 			       PCI_CLASS_SERIAL_USB_XHCI, 0,
 			       quirk_synopsys_haps);
 
+/*
+ * Gauteng Education Dept MODEL-W3S laptops report PCI class 0x040300
+ * (PCI_CLASS_MULTIMEDIA_HD_AUDIO) on the Apollo Lake audio controller
+ * ([8086:5a98]) even though the Audio DSP (BAR 4), NHLT ACPI table, and I2S
+ * ESSX8336 codec are enabled and no analog HDA codec is present.
+ *
+ * Override the class to 0x040100 (PCI_CLASS_MULTIMEDIA_AUDIO << 8) so SOF can
+ * claim the device.
+ */
+static const struct dmi_system_id gauteng_w3s_dmi_table[] = {
+	{
+		.ident = "Gauteng Education Dept W3S",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Gauteng Education Dept"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "W3S"),
+		}
+	},
+	{}
+};
+
+static void quirk_gauteng_w3s_audio_class(struct pci_dev *pdev)
+{
+	u32 class = pdev->class;
+
+	if (dmi_check_system(gauteng_w3s_dmi_table)) {
+		pdev->class = PCI_CLASS_MULTIMEDIA_AUDIO << 8;
+		pci_info(pdev, FW_BUG "PCI class overridden (%#08x -> %#08x) so SOF driver can claim this instead of snd_hda_intel\n",
+			 class, pdev->class);
+	}
+}
+DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_APL,
+			       PCI_CLASS_MULTIMEDIA_HD_AUDIO << 8, 0,
+			       quirk_gauteng_w3s_audio_class);
+
 /*
  * Let's make the southbridge information explicit instead of having to
  * worry about people probing the ACPI areas, for example.. (Yes, it

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261119-gauteng-audio-class-set-256f769ca134

Best regards,
--  
Steven 'Steve' Kendall <skend@chromium.org>

