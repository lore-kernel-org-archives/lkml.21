Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448379;
	b=EPgHzvYmU0URe7wpdv51fyUuDciHAZlIBhEzq9AvhD+49rXXcEONO3SAMXc7ujfefdhs
	 iaOKO65mGEXFW6oHjDriX1e54oxSGc9Rb2jkCS3mgPstRT+iQNWJZJbmK9cHz9ciVnQ/A
	 htX33xAeX3QJxoWtukHKTYYrqxQmK3D1Y1shbs6LEfQJy+JVM8KQ4qoxnodcVyrtQF7tE
	 xSAiGs9tylcjTLAM8QjBkNT2GswLKkiGhzqqlOPb5S5yFe1iNib/TYfRdI/px/x+1soWT
	 b2x+V1Zlbq4mjBcLbMrtsD+4vGyJ1aEkrwxINgmiimjdAygnSvUsaPGuBGvWi3RvPoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+Ao+iArUdzZvDA/o0P/U+DjqkQFyg7GN4QIAQugeBDM=;
	b=YziAoIUc5zFh4BO3wZegVbp2bbglMI53uecfV1OnzeHFlTbnw8/liHpC1Ahv31fIWrdp
	 i8VNUMKOm8Jg1Iupv181n6Se3Kvr0gEvpBFStYtxueKdAixvC0UoU+c/vcoOhcz2n9mzi
	 7tuX23svxmpccJnIl69N5DL5e1cS4x8SRtbePBVfYTDwgMhebYVVdEmRXlYhDES5EGCgc
	 X5vLQ0XwJDHFNbE78jo48vqgwdkq2lfCBiyETNpQjJZCT1aC0OkzTxh+H82gF0yFPeSJL
	 OYz6Ykm8OQrSOWmusfGNL0yk9ilsBps/bnQOc/FhK7wPKi5yri8FWmHUPjKWTcTCagA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrsUUONr;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF64B606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF64B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrsUUONr
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b546061d58so7607468c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448378; x=1796053178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ao+iArUdzZvDA/o0P/U+DjqkQFyg7GN4QIAQugeBDM=;
        b=hrsUUONrG6/XbhHlx0gtlkpF86Eg7SgoC/55/vEVeCdxXyAZrSnQxXKUgLOmBKcVNi
         hgn2qPHXIFz8t8ITCx3vNAfUKTwKXhr7SVx9S1TSM2LpEuSkGMIGrEAKDHbOsqL1kbgG
         sTHDCd011mNW1M6gdMTv1Il+mGTX5LQLcF6mRnhqdhf+dUhWN3nmFU6gwvA7A+naTm7k
         OUtcG79JFaLOyi8FfUXvnC0EJy+4cVniCipmKSSQrFJUtfCCtRPCZhnCtbvv6W2R7g6v
         0XYwO41iN+umX0myX2h10HSngG40g+ihe4100Znk8MPMIEMJ4T1OLqMFtbsQS+Z93UAl
         yGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448378; x=1796053178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Ao+iArUdzZvDA/o0P/U+DjqkQFyg7GN4QIAQugeBDM=;
        b=yNfPrJrZ7KPgWj/2/SsQxWG0Pz/xef2Qx3NEQtvZPPPZNJ3Cc3Zm5RNnF79dEu1zTD
         4LELCZL8xVWdXFQAeF9YWpH5vfk8eqmmxFWrgmE5OpNqUAGgTAyxDErkR+mLyPCoavw4
         JAVdIVjDMJTUtdFE5+3iFis2tJZLBUC7oFz0nskuoJYt9khkEfAhJz+W6blSrpC5Awat
         O9r8YFptzkykO+RiEoRMiyCyyBluXLs1Yj6L+sNgXCnmQYeG02nGLruISUGxcxaM1ndv
         +vrOOSqaWWs1YM2uV63C/nENdYmlWfB2AzWz57t+VknMeDWigTByTmzjIL684WaGLE02
         S/mg==
X-Forwarded-Encrypted: i=1; AL+hErFPa6L/zTSwnXDlhMtKm+fCvt+xSY1KPNQGTscY6jfIELmHtnHrxFROG3Dw9Ladi/vxNeseBXlEXuprf2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bWxsMVCOtQnEfbB1hM+Wie39I8F5RylDYeHr6PtwMZW2vwpQv
	WFoV9HvYEH+OXBDZBvXbBsqbR1cAIInL5qI3DYfDHmsynk5cmxo/apzJ
X-Gm-Gg: AZFdTZf89x9cjLgyKvBmJpBdGqGJuwtU46F8X1zsB3GH6N2Y5eJ4+KA1Go5tTvHDt+b
	ksaTGuqn0r9ZQPJBnL+ZBSKYNNYNCp31UbMrODeE2Cbti1/mOWB/mA2Azndbut/c7l4RXwopfoM
	CvcT01f6SHH8bVbGbnCtNXdeF8k6U5d4XVEaDin4CdAmgxZLMMa/wxI7hNmmwPgdgnnW04oUkcb
	cVqKmrqaQ9YOGY8tHD9jubbuKImDWjNGwPVmolYmK02cie1gC+gsB4RYsKBafrXg4RBgf5ujvDs
	hFxmFIxrENiUu8VE68v3TRNwerWLVDgup68FCIWjPsB6wAbFBqnCF+6nz0VUE3FxOk3H9q+L3TY
	JxGQqOXXFIBVeVRjMNZBtThxfjxnsBqcHdn9uyoCf722h5UsYV2/jGzxFILzStrJMIGWZR4pgB5
	aSZATTr2lsHlGdWaO2jwisoFbh8SrQVhG14l6c4hzy1/QLFt1mc47hWnKr3AtAAUxTTWu+B+K3g
	ApfrOAljhFXzBSEfcJwj57IkYseCQWKONaYYbmlpxSwkDtPtlCNC/D9eRHlmdh/pCsYVqlfgwCf
	1HXkarwrOsMdqYuXoOa7kWfeTkLm+RIhYfx1mpopteBuIKY=
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr11588347c88.26.1795448378009;
        Mon, 23 Nov 2026 07:39:38 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:37 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/16] media: i2c: hi556: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:13 +0700
Message-Id: <20261123153927.2547169-3-congnt264@gmail.com>
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

hi556_set_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. hi556_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its clock and regulators
enabled and its reset line released.

The probe error path already calls hi556_suspend() when the sensor was
powered on. After disabling runtime PM in remove(), do the same if the
device is not runtime suspended, and set the runtime PM status to
suspended. Avoid powering it off again when runtime suspend has already
done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: e62138403a84 ("media: hi556: Add support for Hi-556 sensor")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/hi556.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index a151bab26821..0d1d52d79a79 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1424,6 +1424,10 @@ static void hi556_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(hi556->dev);
+	if (!pm_runtime_status_suspended(hi556->dev)) {
+		hi556_suspend(hi556->dev);
+		pm_runtime_set_suspended(hi556->dev);
+	}
 	mutex_destroy(&hi556->mutex);
 }
 
-- 
2.25.1

