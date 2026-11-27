Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748025;
	b=KFLTJ7k64ThlGzivwkyoXm43KTyQ8H8FssXKtdO73ZDP5zKQjeXcGxa0eyIFBETjR+pb
	 Grox5OIU+J63W3EwTTa1azNAS8kZzXI8GuU07+yQzOJRBPLIbKfMt8GsJOQwuOw3VNCrZ
	 E9jwTZFthkhmICo2bSKoDsiABVktpiuLO/X+lZYe2se76c0xQoljNK1DL2OfjgYzvP13J
	 qcqck95vF1UdDhmTMbIMbgEQYlw98VWjEB/zoOY7qrUV2l+0bTMg1EaoII0kOKRxyHt24
	 zJpFOxDYKOrU/KQHHfhbPdPTxcAKci4x2zJ70lZMZflcYIp1gFkLkR0pwkaAsNzVNhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kIEYquLGrLx59Kpr6VlZaL3fgGAdFzJOpk+rvFhItik=;
	b=CdQWSk7ykW7ATfe0kItrxV2f3qbTyZQFJ6ctjlH+7SeLKeTWMfxRt7home3HROwZUqFW
	 Y3j0Shx2fX+kxBPBTEZmRsuUCVgbFtPbl7tBMQj01LH6u6jTj3xRML9qcdVeipmQzhviL
	 0SOWSFW9opEGOhI9iWUUVDf4CkraC2v6BDqL9DaFhubRWor0VV75Mfr83C4wDJ8t3Ji7E
	 a90L7l5IEyvFMy7P5p9YuZixbky2yVKOrRpZlp1uOdUXEOJ+bTjsCVDT8pDhujYnuFGhk
	 +Bx4puO8dQV86JI3rj+aWy4bNyY5b3vLtYJdJkI/wD949HW6yLqmbfbEA3174JbrJhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=an0wXLNq;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A8606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8A8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=an0wXLNq
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so11115150eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748025; x=1796352825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIEYquLGrLx59Kpr6VlZaL3fgGAdFzJOpk+rvFhItik=;
        b=an0wXLNqmyWWggSf5AP1OqH1qG47Tkz67k+2nSHa6rgqm3L/544mzNiFdhjNf9zlNu
         aZRDhGDj6ghR+Z/ieuR+A1sPpgCfBj8sJKIor+qpuGLcrs8JJ9CG8uJvHtxSR1fRpDd+
         WTKVUcecjmbWfcflek6Ct+wE3f1TaGFte+j42RxSQwTm5mm7XALx/l5YWA1qtb2iN2zl
         g5sgbY9UIIrlhjFUuJ6UUU5rL4IPzre3cPr8qtTxs6MFnVIh7FQea3qQUePl4gbs+5Ss
         zqHFgKhT4Zre5j5radN1t1e26AYF0ab6jZ5HB6DJ5uvPBPHnORoJ19Ur92+CmVvBmz/t
         8HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748025; x=1796352825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIEYquLGrLx59Kpr6VlZaL3fgGAdFzJOpk+rvFhItik=;
        b=HniSc74FmQGF+Lwc6fbL8qfFAl33Ba68fMpIlB5bijMCYmGk9SrG5n0iN893Ab1ozX
         NLd2luIc6oiV3kiKLMrh0LYMq1jS07xUa8Sjdilxwl9tbDSzH1H0ZT0S1W6ELAFNQkrL
         d+yQMtizVRKlKsOdKdCRk/PPRui7iYqj8/BzVrnFyk7eV5n8wLktZ8RWXZaSnszjWJoY
         joxbzP70ydVIBJ+iW8b/kJkUzfiMs2LGEtGG82BaanJfxtV1Yi+dYmnkYUhOGwaxcIKr
         0laG6V+hASbyPqWa9rpXctxdVWHNyGVRhfLHnysfkUfDUn7fxkfvdEIa3MKseNLYWsYD
         SQnA==
X-Forwarded-Encrypted: i=1; AL+hErEMM6Lg+lYxvOaf8wRday7NflQoOWI5tSupafyaNLP45mdr0y5+LW80S8pOwGrJNbdyPF+hl/3BE3yHC6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BIEkzyh5XPh1opkvwwdZQJOKAP+pdApLZKCgwiEM3wRZDeeAH
	0OlIKNRmswosjxnoYE0TckgQmDHrun1/xRs2lEwyb4b6kBlfvP6WHWTu
X-Gm-Gg: AZFdTZeBnzYvwxZkFL+mKxffJh1gfzabN+0rthSwv9R9wZWPXAOZq+tVTX3Ie9yYIDu
	TLx4cPFGt82h9DLoAroD+VSWHiO98ENVzSv5Qr+xw/bI5eYCDMWwLGmIZgURjqdPzMAA16R+XxV
	xptB9fchyE0Au7UkNip1BGqFdC19Cf/CN4RVYDD38rpSrGtC6+hSMqVeAibi2gWo6p1pUHtmx0Y
	KTLckAknrfBN1CQ3dRA9mvynI3uqkNFqX5NOAZPAGPuHQjhAnUfiUGb2ZoEyLgSbe5341Bfv3Bu
	ZJIN3alga9MJBk9+dnkdBNXDt4w26CpzuNZuPFr+kZEzmsiYWOX4Tip/eVh97ORn6spO9RZLggA
	jc+R97zrg5hqMMLHEnIArYmPJdnKdY0Y5WL4k9UEJpXrQ+oz1nHjhPinkUVqbwxOJF6dWj6kiJH
	adEr9raZhEj2iwMDU/5gFZy9FAJKC2HfN1XG+KNMQLfPBiXt93y9DoTI3AAHU1Kcd+ufRHpCHPV
	y3omc3qoVct8QTjcXbpkOk28z1sfdamLtnRxkQi5JZa5Rf6qj4EVyX6HZGrtk+gl6L9iRAfTBkk
	vvpEEkPgigJx9JuqD1Fgg1nP3e6ELJUNrW416fKRmttuVcFpVJIDABCj3kHQBApyeaW8j1yaAC2
	b0ofuFRhXYfKMeRha89KZTOjuN4mBrotvbfhYymgCGMsNlpPii+r/AGAIo8aiaXpTch9+L88j2E
	LGojY1HRDr7nPVkstwa4PkilQ=
X-Received: by 2002:a05:693c:62d3:b0:386:de65:9969 with SMTP id 5a478bee46e88-386de65997cmr3725214eec.35.1795748024514;
        Thu, 26 Nov 2026 18:53:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm75811610eec.24.2026.11.26.18.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:44 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] platform/x86: dell-laptop: Make the charge end threshold unsigned
Date: Thu, 26 Nov 2026 18:53:38 -0800
Message-ID: <97f3ed2d4fe3d3098e5d86b6f10c6c3c16e3e400.1795747885.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795747885.git.rosenp@gmail.com>
References: <cover.1795747885.git.rosenp@gmail.com>
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

charge_control_end_threshold_store() passes a pointer to an int to
kstrtouint(), which only builds because the kernel disables
-Wpointer-sign, and makes the following "end < 0" check dead code.

Declare end as unsigned int to match kstrtouint() and drop the dead
check. kstrtouint() already rejects negative input, so the accepted
range is unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v4: unchanged
v3: make end unsigned int and drop the dead check instead of switching
    to kstrtoint(); retitled (review feedback)
v2: unchanged

 drivers/platform/x86/dell/dell-laptop.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index eca348497ac3..1e2867f182c8 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2380,12 +2380,13 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t size)
 {
-	int ret, end;
+	unsigned int end;
+	int ret;
 
 	ret = kstrtouint(buf, 10, &end);
 	if (ret)
 		return ret;
-	if (end < 0 || end > 100)
+	if (end > 100)
 		return -EINVAL;
 
 	ret = dell_battery_set_custom_charge_end(end);
-- 
2.56.1

