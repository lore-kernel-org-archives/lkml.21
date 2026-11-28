Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866727;
	b=ycg+VgM929lPGyXFt/srycYeVfjQ2962fa5yOhBy9x0RIANzc+djtaR2PE6MWKCE3mC8
	 9UKUwpAT7+pafr/Sur/38PqSBlxk+iY0oxOPWOrqGSFmEs1mC00SAFEiMFBuZxMcRmrir
	 ZobsPnQ5NEblRZAkF8jZdsqGqzSVQ2MiirWeIw8Du8wBAhBYTuXoQTc0TalDei7PR7kYO
	 CaHUe9bzU9Op2ury7H9FeKDRenC07dT9Ovl+fXNOQw+iye7KyBn30VNBI2hTwmSol830K
	 BWLLWAAqK1kK6tY8nzFXvfvy/+GMbTFt0Rcl+Ea6hkWgAex8BbB1YE2DoIMZWE+RvkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SWTA87kb3BnC5vtYNbhLJFRBLMPszC6ScY1egL/JZXo=;
	b=yFOQosKdhL6lQa4m4b3oDuWzxBxOeEdpj4pRiHu53FbuTMELjZjpVEadTRcMVN4pCgKS
	 9wOLDQZLCbwTnFZWkAokQhdp14hC8aRSIx3hYTN3tO/xXloMbXoWEvjzo2TbcdYAOznWQ
	 5K114kaLvMtdlW39dnOkfIFASHNDm0Kso1GCJ42jaBZ7y2kkyTyyxFHgVlanj1W8TFE58
	 egUhVlMtny9WqsIpDs0kY4PAK3bk5tEvU5u4deCaX+qqA82AKFVTYPuWnAtUJUURz7jHv
	 CfMf0RDmRPwfCPnYjSiZrM3TwOlJO4EcZ56Zvy5voLwfmnWACoqGGab2q/VMZBKXctA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMhgfKBY;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11197606A327
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11197606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMhgfKBY
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38190551625so16959429eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866726; x=1796471526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWTA87kb3BnC5vtYNbhLJFRBLMPszC6ScY1egL/JZXo=;
        b=fMhgfKBYzxaPTciEXKI8CG743tw8X0JoogxcQTNWFgJDOQzywO2nIz1BSd1cKuzcvA
         TXw6af9heSOOYxWdt4Xd/5pTf9eJlQf/w56sEQsF5sBlmp8Hf7MJTotCC5d9TJ1cs0N7
         6zoBPs/70kkwO+f3Lz6+FezDa+hAG9QJQBEq8Dvfmj3SIcBHyISB49ZgQryOsRtdX2HM
         czOTS3xV71YmxMNpHWaGeCgiqt1cAjXVxP5htsiI7e2a8WkGYVMhN8LDue+dMkBdrkoB
         ig4ti6ZbDzVgwWUoqMs0FMf74uq5r5DmSMHZYN5MFdbg2f8MmPDNVN+8QHEvef0//m2v
         BtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866726; x=1796471526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWTA87kb3BnC5vtYNbhLJFRBLMPszC6ScY1egL/JZXo=;
        b=uDDNxq3r5qs/Ja1gmXlV2IoaayDWYkFMJwYCGvnGS3n5d6y2Wl64+OXZja3BuNbyO1
         b0FdLIscic3mayJI/PwzU8bugClnZOp9jNjPF2V85PIpvmzoQVIjAOOXhuho5CMYfh1B
         6oV+tsAS+kNauvoWEihS69zOggx40Fjg152C7K80y7nRFZkaLO1s7778vVViimeD5iR4
         fw14W0loJpfFwK9GxmK5GZ2Pbp0W3KDoFe+3mUGhRTMOMsIzH2sgOAgQe//G9MKsCgyu
         LuZzpHO25LcfsqaCMX+IGN+ifElADzwMGOBPVzIemDcnVuGoruSfpathkWLi3qHHP9AM
         skGQ==
X-Forwarded-Encrypted: i=1; AL+hErHWdI/hxIzRJZyQdcqoF38dFGip5VgR3BHzkKmBviFFj9kswK8JPaVqWgJqPz0l3ww1e6Z9bcq59H2b7+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HbqX2fkajphFoEy1REJ7Vq46mYVV/LCoxzysnTRPlr67uUBIY
	/eNCAimVjZc2dEe0Llu+aIgAwLEkxD+WN0RUbfd5ONQjgYtNLTpuDLJb3urRFhyZAI8=
X-Gm-Gg: AZFdTZdz1dhpJSByHiRuXuJsnHv69XYWkfMyNAxndHgnMBPRZOCvlf1ZylTUMSmUiEI
	wf1AORf63MunYKACz0cWcBju6wICaKmUkVckxLDT8y6pBpQGahtWtEk2FlCx4A8Qhf9jHZ88NgX
	5ybc3097h0GEHyqyFES7RDd+EDUYL2OQtvtDM2f3mYT+30J8z1eWTWyx3/Z2PTkWtUz8RaQ+rWA
	dMJgWcy3E/PfWNrpXftjWnpcHzqt3dYYWiDsPiA6bQAfNJKgH+nPeNIBJXKrQ/9KFW6oIK0C+6D
	gLoRmnPamaRugaxbSPgtvPLOHJ23ZTNDQDaLbIuZqkiZfPgx8pHX8vcJRriS+SywzIxekO0Ngkk
	OAURjSu4AHch65K0WQ3AtbYRu/SFQHsmpuApOyCBf1m4r6T/KrNbc6sT2bjX3u6/oD/aN3/9MRm
	rxuxj/mYGsR5l8FARnZMYHv+onct778KL1o5/89CieGaUYYEn+7lBIvIt/eyKVjoUnP/9292+JV
	crLlG5+fm88ju0NDKDCmdRdGVchBhzAC1t0Pb3um6DY47Ia2JG4ukvl7X/Q6ih3hkBn+gldgOas
	EJJ8uXtY9ISFaO0FvgPXqskn2UkTbxnWYvih1Bnsy0baQLbacYT57pN6YG/aQXQYNdHbkNq0//9
	11FIOS/EMZY76gBzLlPrnirIJ+zuMhq6ZDhnPvGxCy3A0zGUjn7oOyIRkm2i/XnZpcdtIM/UHed
	ItOt2pEKXfOfQYcxNdlUUciWIU5aNMx7PKZtp7//c089Y=
X-Received: by 2002:a05:693c:69dc:b0:386:aff0:6109 with SMTP id 5a478bee46e88-386aff061f8mr18853178eec.2.1795866726050;
        Sat, 28 Nov 2026 03:52:06 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm74256544eec.20.2026.11.28.03.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:52:05 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 2/4] iio: proximity: aw96103: use the default configuration without firmware
Date: Sat, 28 Nov 2026 17:21:39 +0530
Message-ID: <20261128115144.557411-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128115144.557411-1-kapoorarnav43@gmail.com>
References: <20261128115144.557411-1-kapoorarnav43@gmail.com>
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

aw96103_cfg_update() falls back to the built-in register defaults when
the aw96103_0.bin configuration file cannot be used, but not when it is
missing: then it only logs "No firmware." and returns. In that case the
chip is never configured, the channel scan and the interrupts are never
enabled (aw96103_channel_scan_start()), and no channel is marked as
used, so the device registers but never reports an event.

Load the defaults when the file is missing as well, as the comment in
aw96103_cfg_update() describes.

Fixes: 07b241262dca ("iio: proximity: aw96103: Add support for aw96103/aw96105 proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/aw96103.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/proximity/aw96103.c b/drivers/iio/proximity/aw96103.c
index 483b3bf18d19..4f205d6ea030 100644
--- a/drivers/iio/proximity/aw96103.c
+++ b/drivers/iio/proximity/aw96103.c
@@ -589,12 +589,13 @@ static void aw96103_cfg_update(const struct firmware *fw, void *data)
 	struct aw96103 *aw96103 = data;
 	int ret, i;
 
-	if (!fw || !fw->data) {
-		dev_err(aw96103->dev, "No firmware.\n");
-		return;
+	if (fw && fw->data) {
+		ret = aw96103_cfg_all_loaded(fw, aw96103);
+	} else {
+		release_firmware(fw);
+		dev_warn(aw96103->dev, "No firmware, using the default configuration\n");
+		ret = -ENOENT;
 	}
-
-	ret = aw96103_cfg_all_loaded(fw, aw96103);
 	/*
 	 * If loading the register configuration file fails,
 	 * load the default register configuration in the driver to
-- 
2.53.0

