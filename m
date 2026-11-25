Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640517;
	b=kPfPrInupJWA9xNJ4lZ4MEq46sa2fF4SWvnrugUaTe/7TDSUkQ75OZSdIYWqkt7uOWiM
	 tCaZuinMp5a11zwn/dcgPYNmzm3NRv9134saIs5XX1TWABVOSCvAyzy4jVnom9ZKgnXaF
	 b4//QC/xRv6Djz9ijvAZqz//5QWygYWBuL0g7L+ViG8LGaTKG47VRYZPr/3DAjgnhhqRH
	 3Two5J0d2nv8JU5jO5BYB/c4Aj3IzBnzN70JdGjmpxUFzB0ca60GoqFxYXyg8eudV2dW6
	 QkFcvs/qKd9F2PL3gRuhBZcce+FZyLhwaRghHM0IWNXgyyT1aE3RCXESSqOy2u/ZqAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rAeuXzOlCTRhm8c9AePoBHHIXKhwDESJdrRFhkUvSY0=;
	b=WxJ9+TBO8DqEx3EdQDh6mH2YEdgyvSRLLWilWkK1riRtxoypC81bAaJCLaQTtKL7Gp9p
	 mIuZfeT9yuKAg6JxSASXV08D748v3xy9BqxthCx00yBeXkKQLlrM0MBL7a3fMD92cYD/b
	 cMzgrM+3QAf0x1a2rws+wRvhZ3RW70OdSv7PkTexmSfgToKvS92gvxWUbSWE1kMPSOglD
	 1H3FESldMu9bJGuOmLsdvKvdtPuCNcj88UobSst/SYIf9n4HMKt1Ufs16P9RZ+LopmU81
	 t5ktDNnrWrL5ovIbQlpmda6NNjsMrzcxmHAIWaDcncq+h6uHQGsoApCdLCYYfvA8Ggw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lp4R2a8F;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FFC606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FFC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lp4R2a8F
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3a348a6dbso377091c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640516; x=1796245316; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAeuXzOlCTRhm8c9AePoBHHIXKhwDESJdrRFhkUvSY0=;
        b=lp4R2a8FRe4Jzh5GBlKmTB7KM/zji+OXsUnFdo9VPbYSW1/vAFwwdd0bjA9xJZe+TD
         Pp+K0qdeIwk3XCf4f7sBpTTqRkjXN/+onfZ35Jy4Yx5kQsyaNa360bnl6mrnWVcxdBdE
         D+/TH8Wn5LmZ9X5+0sssGg0XQanZiUPBMcFmHiAxmqhJekAijeD8RNwoJOwzp/EngXXo
         aoms+2u+8egAut+nWgO3AZhull00a7gi0Fzb5wuuPZnD6+iOmvxf6c3GvMMk0XK0ThgN
         rQVoYgg5h1UL/1j0T3e1WhL3wqaGj4drQkK8Svtj5Mzb76FbMxKL+89ovWABVnfRn1k8
         Eb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640516; x=1796245316;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAeuXzOlCTRhm8c9AePoBHHIXKhwDESJdrRFhkUvSY0=;
        b=noEbL/ZIrPTxw8lAbRuoPQUcZJMcpya+5AjTZZ7ByIwB3H8EgeLqHfyVBfo7AMS1HL
         LW4y+etxWTOTMJRABhv3biwlPDi3mtDU4hgoZB6Iuscy6TI08bGtjFeQppjXxveGNET1
         DFmcEoDulg0pCM9Qpktec06/szP96RoTg4mWdbHFFgKOjGWJX5USNvpyNmRHzHJtwgRR
         +51FhiGELF1H8i1AA8NtfRCF/Pevdg4wFumcFzHpQIEcFWdgbrDd1cDA5cA8LRXEhvaR
         /oMyThppDGaSBICi1QIK9gm5abmidROQFRieqAKkVh9WkCCgCssO+EEXo94V6LRH3Ia5
         GiUw==
X-Forwarded-Encrypted: i=1; AL+hErEiPSE8bqgXzE/9IFNmKg9dgzIH0nutAdXjx0bXU61/fdv+M7QfrkZCOKziF99XzJN31KuiqlJANsr6+sc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/frcvhAUNJ4pzBMAXAhmQPslatvgRAi69GQJNLwLCNQ8Dnpepk
	Ie4wNfOPoSp3epG0aGZfllibHSg8aVPaVf8+baCsJ4eqkCBYMmxjkOZJjfWh6XJesovWEnXLbb+
	txg==
X-Received: from dled8-n1.prod.google.com ([2002:a05:701b:42c8:10b0:1b5:3444:f158])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73
 with SMTP id a92af1059eb24-1b5568f3283mr23214323c88.30.1795640515933; Wed, 25
 Nov 2026 13:01:55 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:37 +0000
In-Reply-To: <20261125210038.1277960-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125210038.1277960-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210038.1277960-3-elkin@google.com>
Subject: [PATCH wireless 2/3] wifi: mwifiex: check TLV header size in ext scan report
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

mwifiex_handle_event_ext_scan_report() loops while bytes_left is
non-zero and immediately dereferences tlv->header.type and
tlv->header.len (4 bytes) before checking whether bytes_left can hold a
complete struct mwifiex_ie_types_header. When 1 <= bytes_left < 4, this
reads past the end of the firmware event buffer.

Require bytes_left >= sizeof(struct mwifiex_ie_types_header) in the
outer loop condition, matching the inner TLV loop directly below.

Fixes: 21f58d200388 ("mwifiex: implement extended scan feature")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863..53aa16c1df33 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2649,7 +2649,8 @@ int mwifiex_handle_event_ext_scan_report(struct mwifiex_private *priv,
 
 	tlv = (struct mwifiex_ie_types_data *)scan_resp;
 
-	for (idx = 0; idx < num_of_set && bytes_left; idx++) {
+	for (idx = 0; idx < num_of_set &&
+	     bytes_left >= sizeof(struct mwifiex_ie_types_header); idx++) {
 		type = le16_to_cpu(tlv->header.type);
 		len = le16_to_cpu(tlv->header.len);
 		if (bytes_left < sizeof(struct mwifiex_ie_types_header) + len) {
-- 
2.56.1.839.g22a8290db9-goog

