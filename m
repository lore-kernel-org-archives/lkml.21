Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082242;
	b=YLyQG+B9gomRIhEqktglxZQZ6+9w2poH3hC8KmN+wEtHD5lIYcQ4RoIkzRQ/LMLMiz8u
	 UkhvB6o5mfxtTwQXegl7EumbbKfimBtxxCbbGq6xhI0poteMy1ksH+fQcP/d2hnGeQXKj
	 5bnqOuBa90IoIn4bCHA25kuGZOAsqofHn4Q+fOmFiUythdH33GBQBKYMruBIVWY+ZzgMC
	 YJ+Zjx2jpU3Qa/lApJjSUcq/VrTM/x79Lt14cqKwPncGZ4VaXG8prW8KGySZg+PJIpGvK
	 vtdzbfMBYvyX+R8hilVZtfJ3onhV8U90Pplb0TZbJRoif0Bf2nz/bR+Q7WSkFRpan1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2V+wGVkR/bmuUwxagpFjiS03nC66w3wqlw9sy1FL35g=;
	b=WFZ7X/QMYex1p8iJx0jxRbo9hqGtFwStEJuwELGLEpipv1mX7e6dPm9uXIwRRx/ZmbAE
	 VCeeHpWev3cFt+W5apH5Nlx2Bj37+XZT8cLN4yxyi0vQZZaGhgUdW5pNSz4765xoEz6+1
	 G2/hY/VCSXjb+41HxznMTF2KqOY5KTr4kbLCc6op40dhIYYdvvGc39bBK5BnD6LIvddp7
	 cRQRPU28O1ztR4PslojziocWWaK5+/ZXQswbcP0bjRPAZJFbjNLOFkoumCG2mm4+bZced
	 six3B9uuGcSvy6VrQx68FYQr+Ew95bPR9IiNSYMrkPvmlHarYbguGLxkNY625ayn5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOOvgliG;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B3606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90B3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOOvgliG
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so4672438eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082240; x=1795687040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2V+wGVkR/bmuUwxagpFjiS03nC66w3wqlw9sy1FL35g=;
        b=mOOvgliG/IXzKqHUJra+5P9TKS0iPzaUt8dyPM425Qo11zKK59R2lrMDP0jwsZnSui
         0evw30p1b8ZMLuxaEwjDJJSENgZ8DRtfnIHZ5kdovnZvzMvg7ePgWfikU0AHOW/eNJCQ
         RHYO6zkU0JLh/QMfGNZO9Qh3erPMNaq7oP9X1N7g3vnteWNmpYke4uB6XQY5jDmT8vYu
         Dt0DbnVWxxcWreHW1C1UcEJuQ8aUWcdJWY/PXgSLTNj2Qn7+mxqLMv21rEVLa8815prH
         76z/dy6w9Eegcz/W2AqOPLXJDtLpfASR9XsJ9D5aH8gle4US48OJX3R3jX4hlTG0WJku
         bjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082240; x=1795687040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2V+wGVkR/bmuUwxagpFjiS03nC66w3wqlw9sy1FL35g=;
        b=sJNdnqMrvHdmDnjR67OtwTemiRy0G82olmka/WhNTGpJfbjureMRcqUV5los575vN5
         VOHStoFAm/B9hoIMKW3x3KSdzNj8MFZeFs7037WRrKvvuGopBts3E6fG/eHogy3ajBcc
         SUwgXjiKUhYNTu/gj7QQC1PNWBkOyt25nEkPuW0MIVo8YZXR/lmpx7AsFAZKZ6KxtFfW
         UhPjCAJruSSqy3BWBsOx0sFYqZSRJiXR7lzqVa3pGqmzSAHaHH3raVxphYpPbuJ/f8CW
         +qOGsLLazdcaol8Rxf/gvTXbQsgSJGdKWRXXkYcPUbhglNI7R1HkHgRs2Kd/X3TIEjrH
         wlvA==
X-Forwarded-Encrypted: i=1; AL+hErGJO/OOIXVEPYjPkQaM9f0n9Qm0snGH5+HpPIdjqksTneRPgXrZnAvrf4BK1DA2EH6nqqnVZ69tzIWzulY=@vger.kernel.org
X-Gm-Message-State: APuU4Z87BRj7yZVPWg6cU0s0MzPSaj13pUmuNOe5PjOE0e7CMjTpEHWk
	Z09lUoMvKjlK9dkddxW4U9om3By7wXCsmxcjEY6BDoa0FH1NlkBOJeUo
X-Gm-Gg: AZFdTZcZi8NKCY7+cC4/8U2VgOMbq6UnCbCDF3csk1dX09krGV/UP7VwZ0enLmqAY8I
	HzXpWamCgDXDK8+ahxOlcCwYUCSEdI9Qt1dURFLEXpF/Ce0qPYsKowYssXJtWJV4XqJseUVeXhl
	cBe1D5pnhZt6LVPWLm3jFYvSCldcPTx6KNpe7/kMyvTixmZQ2gfllvJW8aF6hXeDcqoTrT6IQHN
	DVyV75zL0Oc5lOuvDosErc9hsKWK9SEDljSIKtrVkypIMKsoVSnZBC5e9LEuGMbtn8sIHGZTD1m
	tJhtLi/SbM+Dz6mKRc9lEVUGXiV5AlV/5tKXT3m9ewml+Z72a0XGf1e2whWIvYa6RjubwiBeazR
	5+j6z3vs3ZGtIFZGDD8+DXwuw8BsU82w8TGTh7Y3Xk9cEHwlBuWqQIxhN3JGvofnfcSlg6xkBvg
	C+TCqmAm17Le7UJIM76zr7Tdg27cxacvlnD8qlqu7QLeqHkoLRT6AeY4f5tw3PVNjW46pJ6Ggj5
	gErs42CLCGNTNJI3dSTelDMoRcxU6Hq/Hsy4dUDdSOG3QRhm6BeoMUFkEtAwOyidcmICqPqIcJq
	PNOpAiQgnEt7PZFf03zT90mgeBNJqQRSpjh70PzsD6xD2leKrfyUAyxS71DOFOuHuY+f5Z3jlvI
	=
X-Received: by 2002:a05:693c:415c:20b0:384:4451:f6d with SMTP id 5a478bee46e88-38444511167mr1764888eec.11.1795082239992;
        Thu, 19 Nov 2026 01:57:19 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm24172665eec.5.2026.11.19.01.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:57:19 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath6kl: avoid A-MSDU subframe overread in aggr_slice_amsdu()
Date: Thu, 19 Nov 2026 17:57:14 +0800
Message-Id: <20261119095714.991770-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

For each subframe from the device, aggr_slice_amsdu() checks the
payload length only against the range 46 to 1508, not against
amsdu_len, the bytes left. A subframe longer than the bytes left makes
memcpy() read past the received data. The u16 amsdu_len also wraps
when the frame ends inside the padding of a subframe or is shorter
than an Ethernet header. The loop then reads past the frame.

Check each subframe and its padding against the bytes left. Treat a
frame shorter than an Ethernet header as empty.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under AddressSanitizer, which reports
nothing in aggr_slice_amsdu() with this patch. Not tested on hardware,
only compile-tested with W=1 on next-20261116.

Fixes: bdcd81707973 ("Add ath6kl cleaned up driver")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/net/wireless/ath/ath6kl/txrx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath6kl/txrx.c b/drivers/net/wireless/ath/ath6kl/txrx.c
index 609d458ca6c5730..7ae14d470627276 100644
--- a/drivers/net/wireless/ath/ath6kl/txrx.c
+++ b/drivers/net/wireless/ath/ath6kl/txrx.c
@@ -997,14 +997,15 @@ static void aggr_slice_amsdu(struct aggr_info *p_aggr,
 
 	mac_hdr_len = sizeof(struct ethhdr);
 	framep = skb->data + mac_hdr_len;
-	amsdu_len = skb->len - mac_hdr_len;
+	amsdu_len = skb->len > mac_hdr_len ? skb->len - mac_hdr_len : 0;
 
 	while (amsdu_len > mac_hdr_len) {
 		hdr = (struct ethhdr *) framep;
 		payload_8023_len = be16_to_cpu(hdr->h_proto);
 
 		if (payload_8023_len < MIN_MSDU_SUBFRAME_PAYLOAD_LEN ||
-		    payload_8023_len > MAX_MSDU_SUBFRAME_PAYLOAD_LEN) {
+		    payload_8023_len > MAX_MSDU_SUBFRAME_PAYLOAD_LEN ||
+		    payload_8023_len + mac_hdr_len > amsdu_len) {
 			ath6kl_err("802.3 AMSDU frame bound check failed. len %d\n",
 				   payload_8023_len);
 			break;
@@ -1035,6 +1036,8 @@ static void aggr_slice_amsdu(struct aggr_info *p_aggr,
 		 * Round to nearest word.
 		 */
 		frame_8023_len = ALIGN(frame_8023_len, 4);
+		if (frame_8023_len > amsdu_len)
+			break;
 
 		framep += frame_8023_len;
 		amsdu_len -= frame_8023_len;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

