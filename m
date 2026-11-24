Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561977;
	b=4hCygk/WV/WJM2HBkefsxN+xVXx3WCeMM8562viTx2tKH3G5iZbAih9rzqvBtGAectJD
	 T5nLtRdpzYQx0THdYMzx0n0dD2+LRDoAmiv2zRPG76vJap2ZItxfJzzSAi7YBKEpCxXHU
	 IsAxD2OzzPFxv1Kj/N12wBQOQIdzm2eh7CTYb0Aw1lwJa4f/qRGpMg2rYWZDUr2Aa6rSi
	 waCb91KV2xmloSmrEmmw2fhgsgf/DQcH9GFNqEdkYok3v0yGDoLHu1mJzjOFZvgcK/Kud
	 aYEeIcHiFi+ZLnzb3bGCvusu9KA2cxjugn6iFcNjwPUtFGsZEu1Li4Q+pmSLXvnmmbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
	b=4c6/rwtBwHE47YIQib3oTU2jLXcwW6BzcNHDBapaJ9b90sIT+b/QS83l6WKWC7xPSRrd
	 HnmK16qodDzpJ4AUtv3mNTJVcuIQ+l7tn0Sl+CTmz0u4pbR2uCtSb+PlwAewun4DuSHov
	 X5DYuPeoKFfrUoi6s+OxXC7Mn2pMdkfSVwdTt9O/XkPAkiR879yDBMQqt8fG56DXSgJVO
	 7cFmCU22+rBY1hFoYFHxIARI9TTx+I93y7zqEEEx6jPWXfjeM4IfBHsNZESkIayhiKI5p
	 l20ItkbETI+XbdAWBeWqBbRMQLEDGgVWqqLw9HH7iiun4CbxMwMMZhw+0NboMGB7O6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CDLUc26G;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C26606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C26606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CDLUc26G
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso49089225e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561976; x=1796166776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=CDLUc26GksTMAra0+lV+vKwcRDN6ljY0wmeG5ULKr75IFUdliDBmMUvTQ5ptYCjm4C
         Ob65/ciwKwLHwDt93tlPX6Xt9MXWQ4Fgz8uqWttdaHiFDF4tR0xG8R2fqmJAE1HVAVTB
         YHfafutWrQIV6voEBkN7o/M0hDGhQWwlNov6gaBE4Q113AGeBI3oxwoFjCkNDGWUcLIU
         Om+epPqmV/uL+s2P91VWAYAFE834Xg8u6iGCDDKBOYUayY9z4xmogM0cj3NlgW2DEDBU
         bunTWt1+qTSzE0dBX+y8qFn+jSobHP/76vNGiF0ilM3VRcVbsw0S57IcUQPRQ9kaFTL8
         ll9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561976; x=1796166776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=UO2ldScgYMT+vlF0g1I8zOIkBm8fgV23GCt5bC8UHRsZ+sMH+42r72wtFz5vVmS4SS
         90FOrVRPo4QjUcNCqIvaHbOZuU5V/WsydGvnrwi8Wk3n6P6XNxO+q/nqRJauI7cOeWSw
         LvwH+WiK8CygD/TOhdmgeVAXRrlQzGrWSET8YdzssBco+rA0fiDcwJmBWJF4u7K20S2c
         Ipy+Ytfrez1Fl6jteEqP0lNBYt5eVsRXCUFWKnCIl5v8gEXMidGCh7mu1/zHecG7xmMO
         5djxbQjUAo9IlhrtKfgClHB+ZFTkvYXsqzcx5XOdB4aw6577NOP4/I65Yt1egGzEbGNI
         Q5hg==
X-Forwarded-Encrypted: i=1; AL+hErEeDZoEjtQFvLjia+kFfjbvgm8vSjiWRC18/23jwqgOiKE46YlerT1Ne23mYirQWNRMHJ+O710cdqxSH8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5YUBjer5rxvvLuVRB3vaOVVUFYwIj+xb45TgQ8/zSsBnciMtR
	8Oi5uhn4cgvhIBPpKhHMCmhHv9KYOtxjyDaoxErfbZoSeP3UWLZRPlfJ
X-Gm-Gg: AZFdTZcF0vi+EqvnK8LDCeL6CJxOLbEDSlfJf9iSjMbgxQ08pv1qedIJzWWU8VY1eyO
	y/Uzp6oC/avWhNHszfC/4+/VevL364BdUSBHeTXyrK5VhCSMK8kZMmaqUTvP3ON1BhDvRbiE6fE
	BTioHFFhYLhY8kyru03ow/tbxSUBPz0WYdoNk+Zr3OQ4dj8khT5qk25ZHuvxQZyzA4qLvYTlm0e
	Su90Z7Pb6J5CqBdLsBSmR6XbzYI9P6ddxKh3tviFjp0fViZcQYXSDOdfpP6Kt44ZPHY/mRBKuuO
	kGfFZqnn/xXe5osdmxNy5UnNK2WYNnTOmbS8GpWAGQ7fSOHcd57Ww149wbn1AA8bymQ7odxJR8h
	rGpyKw6nf29s7qMeZMhvZ41RUhmKKRCHDYayl77g4rs7oMs/8c7bQs7QjnI5QvcMy2V94Zzvejz
	TX1qj664gboparWVhBLEpzTcqAGr4kyU0xbzrhF9mrEVkTMo7Xr0cmdveXCuss6Q1SvjrsGADYC
	JiAdWmaieih9hMGiyi2p7X0paI82fsaHkVNppDC5enNidws3bKeLrPkyk2szjnJzlQjl4zbTKYP
	rL5L6nw7Ny04I9yG9IQ8BsqGPcYrMvU+xKunZI8gmKndtrrMjwY+X8f3llACXLNQRwNOmpvG2Z2
	N2T2Md/g0NRqMeAdRP1MZVCrc
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr336408085e9.10.1795561975632;
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm527766585e9.3.2026.11.24.15.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: airoha: fix objtool warning with memif probe loop
Date: Wed, 25 Nov 2026 00:12:43 +0100
Message-ID: <20261124231245.271869-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Objtool produce a warning when clang is used as compiler. This was caused
by the memif probe loop when assigning the irq to the memif.

The warning is:
>> sound/soc/mediatek/an7581/snd-soc-an7581-afe.o: warning: objtool: an7581_afe_pcm_dev_probe(): unexpected end of section .text.an7581_afe_pcm_dev_probe

Fix this by giving a fixed upper bound for the loop for the memif as it
seems there are some problem with detecting the runtime value is hardcoded.

Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611201414.1NBNxorL-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/an7581/an7581-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
index d47edb630452..b17d58f25d9e 100644
--- a/sound/soc/mediatek/an7581/an7581-afe-pcm.c
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -447,7 +447,7 @@ static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
 		return irq_id;
 
 	/* init memif */
-	for (i = 0; i < afe->memif_size; i++) {
+	for (i = 0; i < AN7581_MEMIF_NUM; i++) {
 		int sel_irq = an7581_memif_irq_descs[i].irq;
 
 		afe->memif[i].data = &memif_data[i];
-- 
2.55.0

