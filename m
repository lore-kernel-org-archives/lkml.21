Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448398;
	b=0ABg0W8CWGKKucApBkOXWQ5lEMxDgsFny/Ps2M1sTocmI3gOrfKdRHKIihH709hIqvlL
	 wFz3qD8LxkX6Gi4YLxZrzWEkg828gTEtW66i7+mkZLdG2gOPBdpsqeG1GU7RsbxIifR9t
	 HqrRA3omxbHxl75Iv9aQVcfMHx4ROnTG+2p+kMSWtr03jkMJOMwamwhP//GlgIkJVmS/j
	 8r/Ezm/0/1MUyK1q2dItzlczLWX1bJjicrbxZOVHGZUQF6deDqNK/NjIgmopPFXoCrVkL
	 q9bASeGmtKuPKiWGm6CB1VJfMYcb7dRJvr5k0eFqnZ4dkvzki3S7p5OY6EE8pyd22gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1GFxZl4y484OqU2tYpxeVAzeWG8inzouoinZygUizxk=;
	b=iREiR4MqD7q42y9uvH8ScoIMvABFcmQobctiG69xAb2iU47tycaFlg2WzmQjHzP3O1Jq
	 yLS+wy7Q9NX85rieCJJEMbmfhgI7n3aJ1sfXCdqEZsIHuNNBVig+tbE0a3Oj9TuaN/GLL
	 gIwCf/ltP8EFSZiU5M7f+lN42XYMS6nlNOjl77otCd3KTDYVm3fRKji8BCiy4iPZnSuKR
	 /o6J4P5/h1nmWAPB/PgFfCPVETlbRIml9qVzEm9WXobkKJmiNqOK4IRrlP+/2wdQfYyyp
	 cVS+dQWsenZFjfJJh2mk4IZIN66wmQ+z0c/dWqcHNHXhUODDiC9AhMZrl08rAq/U/rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iM529hfW;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F36760A261A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F36760A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iM529hfW
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so7608428c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448397; x=1796053197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GFxZl4y484OqU2tYpxeVAzeWG8inzouoinZygUizxk=;
        b=iM529hfWQ+n94eebPbIoplRbcrnJHE4vvXXd0I8VP1GY6h17sc42vj54pbR1neSnqj
         7CFdh0nJmR2V+6geapTCnOfymuO8B6lj++4aaL68o6LUIf66cZtKUNZOtQ9cmray/7Sa
         rgcJk38ZLsEPfQJGI2/wNaeAerZaXhU8Ar/Y9jOh6DzPdRtU70cI8qtccUxr4fylnicZ
         Vzz4Brqkj7oxkJOhjTIRO86XMdoFM6NBQ1i9MXJOUIcpbIe2QnNB8Z4b27jB42wxBTnd
         FjBkcBlWzuwhToVqjJdcjaDal0UiugtXDwgM5al4U25boOgF4F7wazDFV7AavZa25ooY
         kWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448397; x=1796053197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GFxZl4y484OqU2tYpxeVAzeWG8inzouoinZygUizxk=;
        b=L/rdvcemHpD4ytG1vmQLDFpYi9bCOxt0Dx9Y/CV6tBSo6utPYyzdU6unY7EQX2gj4a
         Cw3CE1pdhf0BaQQIk8LzGOTUdL4qlEtpe6T9rqaVgf06bOgwstTg2Jh1HzmDZ8Xlnfoq
         ZFrry/L4pHqXuHvbcRcQyjC7qD5C5WT2uD67Gh7XuYJhuzKQGAPfMwvqaKNBPPMyTCTc
         d6drlvOmfC2PAVY0ZRrWCOEIWHCYzvVfP4RckMgveKcLzVIhEy12BoVxra+O2BsWNh/W
         atrZEn4rF4wVYCx8L5rm/H9cDB1TkXwZN5nKTaNXabby2Lq4XvsovxeWFnDkNkJ1PFlc
         INlQ==
X-Forwarded-Encrypted: i=1; AL+hErHE74X8p6ZGPZ7iNFUfFrpRwrvlPRrol30E3L+czNh6OKOSCIPW/NQxRV7VXW6C4mlWaQk41LAh13O7lxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oo1y3BbNXDLeBPu6WSKM6di5utZUM1M2+HM9TJPVSdnCVPTqM
	VGt2CGve0B2ULD0PbC/IYaTeAyXvX4YmzU22DLtAwEETJWO79DidonzF
X-Gm-Gg: AZFdTZeU3msBRgMHhsouo7ayQl4ius+S6YZrIyBHrrz/VA0TZPBjx4GzbkKG9yFlA4u
	0PxYXdLD1IpdXJ8j9C/16UVc991UDLy+hOM+v43u4cp/a1q6qv6aKBPOKCOpTro/Ehw2pH9xFAp
	VVmKbfAMJ+ggzPmBpSFJZ7PUIMUEUQD06rbgsQGFwIDRJjqVDHP87GAQDMRBSrC77koKVhBwsz2
	nPE84NpkDHYrhlmwiQ41Qbnw+tzVa3vSV/OTp41QZWrxSVrfUJ2u0vkG7EzneAcOSf7P+iaAaDO
	CWuEXat5G59hlhm3YTkjRNaXAvPpyspcjcGK6yGiPNoZ8pv1VnShnZBO4fmshJTOpqrUj0k9cBk
	nvhX99B1+mzy9I2S5gn+y9Ek4P79+as0jzvsKpP9stEASY9Ae+Fd7WtLyDR72166f/qjlM5Z+Oe
	eiUPK/Znuh3+k2LHwO1zBMLtbBIo+MNNb5/S61UokA11EFOpYvGnjppL862nnlhnCPlzw4fdQN3
	Iyj/11QnWJqMSXoYs6TNi3f8BJ2piGQ38dsvZW4USkwRsgrx78DVCqETlJiglqxYhPQAFjG7xa2
	qE25joI/uMvT0yxsAYQ3yoj9I+mAZcLf0dVVakPorwQtlAF6
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr4476005c88.22.1795448397400;
        Mon, 23 Nov 2026 07:39:57 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:57 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/16] media: i2c: ov8856: do not power off twice on remove
Date: Mon, 23 Nov 2026 22:39:20 +0700
Message-Id: <20261123153927.2547169-10-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

ov8856_remove() calls ov8856_power_off() unconditionally after
pm_runtime_disable(). In the usual case the device is already runtime
suspended by then, because probe ends with pm_runtime_idle() and the
stream has stopped, so the regulators and the clock are disabled a
second time. That can trigger the unbalanced disable warnings from the
regulator and clock cores.

Only call ov8856_power_off() if the device is not runtime suspended, and
set the runtime PM status to suspended afterwards. This also covers the
case where the device is still runtime active, which the unconditional
call handled by accident.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 08304923d317 ("media: ov8856: Add runtime PM callbacks")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov8856.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 1c879e461fa5..bc17deb945d9 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2367,7 +2367,10 @@ static void ov8856_remove(struct i2c_client *client)
 	pm_runtime_disable(ov8856->dev);
 	mutex_destroy(&ov8856->mutex);
 
-	ov8856_power_off(ov8856->dev);
+	if (!pm_runtime_status_suspended(ov8856->dev)) {
+		ov8856_power_off(ov8856->dev);
+		pm_runtime_set_suspended(ov8856->dev);
+	}
 }
 
 static int ov8856_probe(struct i2c_client *client)
-- 
2.25.1

