Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495366;
	b=odIJorUIHspdF12Q28zH+ICmfIDfSbpj1DlcWmGLHz9RxcPiy527H8k25bnNKWFDTwW4
	 1giId9rXGo4l/kxFr39MfpTNHkMBQ8VLB99UTg5rQm+X4a94ZppAVcdpznx087UnpYqnP
	 b2S3MnrrWV0YBs4rfQujNyxt+ch7Uyw9CQt9JpSYlIJt1/5OiyH70uvvbQe6XIqMa/Fs5
	 eUNZcxbzU0/IxJfdxwnCInfKMv7u2uJOClVDXRGGkFkjThI+Ipcw9M1tidISAe/MjpDDM
	 5Uqjy/GGVsd+rahxIWN/7sdV9VcNhEanvb3duo5fMOMJVCg/Ft6VYMEFLMHcIoenmUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g0REQExNNyBnd2hiqzHK7o6gPmAUPJWtB27KGrID9vE=;
	b=UVnaw3D6K9rI7ocMzIC3xr5zaFFJmBlETBG1MHkbLDmTW/7RGPtI/Olcmj2hAfPf1YPu
	 OAj2NgGDfHQnlnfk189mNMkkqocubGPu5XWRUg9rIvF6C54nchpTJkIiKWXpnnvspsEbk
	 nj5HwMEwD0aaELAkTax4ROVMIFIt8jlkqsKuK0YEOJ0r4gglDecn8upFtJKRULAXlQ2Qa
	 z8DPDn7IzMxj8s30HoXG3zD5/cvUwV58pAwUQ59oO9/ohJySDLe5Sb4z8v59uLrAwQK+1
	 pNjfRKsPVWWYItBTOscrVbc0xxFVEYcLaa7JpeJOSb1AZZSFhk3IAWe4kKNxjcSXkZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PE1U3dGd;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072E7606A6B7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072E7606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PE1U3dGd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-382f4710a17so6969582eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495365; x=1796100165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0REQExNNyBnd2hiqzHK7o6gPmAUPJWtB27KGrID9vE=;
        b=PE1U3dGdxQ0Tp+ZOsxchIei3Jcht4ICbD+oLd4d7Shm9oMxLE/wjt5IB5Jpcq+bBjo
         wqeOIGmAC9UK5AYWN18JGHj3gkREOCjJnEihTFLTExI9LovkAFtZjfSPlICxtsGy2E4e
         BY+Im2rDxgoTq7iJTMPkJEHrZh2CaqxoUMC1UoYZ03J+rv7vIjFoyqx+cXWuNZpnfqs2
         Q/cZsiFGdTc2AOx4H5eKQOWKxbHS7kjT9tXWw0KXwjOP2AslDKmLU/FuIB6DhQ1wiW9w
         88doSUvOU/AjAXD2bRq50TkQFIR4Lnxm1D8LXsbOjp8c3xH1CtLRBpGvo4iRlko2mcRW
         8xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495365; x=1796100165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0REQExNNyBnd2hiqzHK7o6gPmAUPJWtB27KGrID9vE=;
        b=UK73VLp7CbXZ3AuW6ktkxyTbNWRGO4M/2PzwgX3alExKe0Xnp/I1FKILgMo0ekT2Zr
         Bn+BpenvSzHk9rjV3V552K8vIrb3MvZhda2fImHHkdZbVFPMHeXqaDCDsUzpe0GYcO4i
         Z0RY2DbAmIlccOxQm5RL8xKprfDUFdagYoKU43FJl2l5bZP6S28YCV4Z38Dk7Pd70waK
         blK8k3ynyWiYYKL8rsknuE2FAThkpE/9hVUK6xDHBNaZnA8Uwr4vvC/Ca4kcISeqqLtA
         hmLa4OW9PmSvPaOfQAKPWSfIhG6sebzUHqfeZzVXAqFIvifnccHZTiLzu/2yVYA74fcH
         jBog==
X-Forwarded-Encrypted: i=1; AL+hErGpGYs+L8/7HOhoBCACPNoN8cqwT9nEk84Dm1b3sVPEvFT9F3pWyEnTaa1XvunRbgjcNrJDewxtT5mYTMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b/VBkQl8ZWu7e+yTi+dAyrRFEFa/bV2v1SLrYj3THZhIO2nxj
	DjrsG4JsDzWbey8+z1xtyZVBllRnGLz+a3rQyyH9haAax5O9E649yltK
X-Gm-Gg: AZFdTZe+lBwx0/pXalxfRmx6RaNHNUIG52r0xMlnxtz4td4+n7LUmg64KlUt4QP08QM
	XfHA0AT3R5yDgNLA6w4aORoddWTChyeyD/bPWNbEqzzsmctzSFG3TfJnHh7IGSOZ86ScCgwWyFO
	OAzxUr+zvD1hkgzUxY+6juhli4pigv5KkUXVr4KuHzWtUGy9JyMBEnc7/LTey8/Aa5qRw+2vd1t
	sTPJwMsWDbPW1pfP9rAIJJoNDfirYeajd87ESYCcnY206h5T4clw6ot0epsqOE7Qk6gOIyp9DhC
	YIEx8RPl0t8ZEktvW3JGl9Hy8NqVEEmFYSAY9l6IwfyZT8IF99/Kz4JTM/MuugFZ1XS8iHzpMpD
	Ds18U5n6MJyRphjkm/pxxMVSTFNzVeFlROOlx8Qfdmv4YzcMftrufqSEhFganq7I0zMahPpigRA
	OICxH8yykBwLEKAIUjNlwhE6iOuo7euG6c5c1WZGZR2mGAb5QtmkvWyshcBGfcQizXwupqz7rij
	7iVt2v4euKJXwCDBLbOyzEjhpHd4P1QfViF8mNYjXk0MSOgBwl0/G9M6ZPbKFnn5NSQd9mZ1M5a
	+VlMT2MjH+sFaBKM2V52Sia0IyuTFCFoXR5hUfWiuf6iLAjL4QgHHliEQce331B075PjBDUEyE5
	PIXqsB9Ge3EKf/c/Tc/4pKzVlYQGfifUQdmZR7/0DMbnfsmmSMzkVJUx66j+1/OYm4DOHglmt
X-Received: by 2002:a05:7300:1486:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-38570e24c35mr18256272eec.25.1795495365075;
        Mon, 23 Nov 2026 20:42:45 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm49224329eec.11.2026.11.23.20.42.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:44 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 4/8] ptp: ocp: handle hardware selectors and combined DPLL input routes
Date: Mon, 23 Nov 2026 20:42:43 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-4-ahmadexp@gmail.com>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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

The selector table index is not the hardware selector value. Passing the
index to the SMA setter can select unrelated signals. Use the table
value, as the sysfs path already does, and mask the direction enable bit
before looking up the frequency.

Inputs can feed several destinations. For example, IN: TS1 TS2 produces
selector 0x000c, which is not an individual table entry. An exact-match
frequency lookup fails with -EINVAL, preventing the DPLL core from
reading the old frequency before a later frequency change. The error
also propagates through the DPLL pin dump.

For input combinations, report a known frequency only when the selected
frequency-bearing destinations agree. Timestamp and counter destinations
do not constrain it. Report zero when there is no known frequency, when
destinations disagree, or when unknown selector bits remain. This uses
the same zero-frequency representation as individual timestamp routes.
Keep the exact-match requirement for output selectors.

Source-derived tests reproduce the selector and combined-input failures
using stubbed MMIO and the DPLL core get-before-set function. They pass
with the fix under ASan/UBSan. No physical card was tested.

The issues were reported by the Sashiko review. Codex assisted with the
code, tests and changelog in response to those reports.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/179538006772.3135.15875996486888374193@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Renumbered from v4 patch 2; code and commit message unchanged.

Testing: 4,669 input-route combinations and X1 direction-change recovery.
The boundary test also confirms disabled X1 reads zero Hz and re-enables
PPS at this point in the series, before patches 5 and 6.

 drivers/ptp/ptp_ocp.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index b16d36c3305f..df1a428eb2fe 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5869,7 +5869,8 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (tbl[i].frequency == frequency)
-			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
+			return ptp_ocp_sma_store_val(bp, tbl[i].value,
+						     sma->mode, sma_nr + 1);
 	return -EINVAL;
 }
 
@@ -5887,6 +5888,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 	int i;
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
+	val &= SMA_SELECT_MASK;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
@@ -5894,7 +5896,28 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 			return 0;
 		}
 
-	return -EINVAL;
+	if (sma->mode == SMA_MODE_OUT)
+		return -EINVAL;
+
+	/* Inputs can feed several destinations, including timestampers. */
+	*frequency = 0;
+	for (i = 0; tbl[i].name; i++) {
+		if (!(val & tbl[i].value))
+			continue;
+		val &= ~tbl[i].value;
+		if (!tbl[i].frequency)
+			continue;
+		if (*frequency && *frequency != tbl[i].frequency) {
+			*frequency = 0;
+			return 0;
+		}
+		*frequency = tbl[i].frequency;
+	}
+	/* Unknown destinations do not establish a frequency either. */
+	if (val)
+		*frequency = 0;
+
+	return 0;
 }
 
 static const struct dpll_device_ops dpll_ops = {
