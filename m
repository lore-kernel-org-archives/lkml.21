Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685921;
	b=u9v+c3uIk2kd05bhfoZYG+zvqSNuiyPEcbp19y/3EaDvqphD7xdm2Xeni3hMLg9DetrR
	 /SLhbRe+1sLSwWGPYM/uWvQgG3oaRCM1zQQFoPNDui3SiscD05HPeSicEh7fh4kZdu8ID
	 Ua89KCuqclNcQyjcHn+XrOuPk/udLOxVLNA4cj4q+jhLvd/lFtw6UrRyJipkq7vC7EJuv
	 CMTLnd3IvOWZbzPB/on78kM/GF5usCM74aWwz1yH7vCf25T3fduKZ52Mv2EhyUfxS+/z8
	 ZJKgf6B0jEGLBOOgH26frpX2HotLG2Kv/n+cmWnjetrwc9c06T9/72Z49RKo6ixGnkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3dcSItid+640QQ6B4SJ+u9MysfBoiq2+UtuyGaK2ZU8=;
	b=gs2mXgl57roLPiQpiS4kolg1dX6RNl/lBi5aRY9dLb2XS8dLUCbqHEJluIfN4xJNLOGA
	 1KWIkikHqnSntRY9Qohg7U9jkg7u86GrWM1XeSCdOIg0YpH6yYSB+9tb+TNYYgQXJbe6t
	 6egcIPIpRBUH0VaPg/DrchI0xkcRf7LWEEMXpbVlW+hcgud3PzW9UHGUoGnLk1oHxwoEF
	 klAmXwjWfRq1DUk7LMgwnpD1MU7h1UmCxcwkI/lr5JppmfHp/1iYWXQN/EiGagOwXD5/v
	 PSXi/MP0zaie3c5jmNVCiytZZicKItjJubrCcTdxTE6Pd4KTJUTL1GupJZJDhdUJYBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQuHJbEk;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C88606A688
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C88606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQuHJbEk
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386ab9ab619so8886150eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685920; x=1796290720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dcSItid+640QQ6B4SJ+u9MysfBoiq2+UtuyGaK2ZU8=;
        b=OQuHJbEkv6SkaSz8rAnRV8NWVYuVN7xnPksPb3UOji7J3c3KM2kl5kXJYeNDMIcpEM
         6veLsMMf5XFsrLFwsGyMnbmJERHNkWXWNFNTDNafv7tLD07NP2tQS+5IjP2iwD1OpBFZ
         HR0XXn9okyg6nHI1vo9IsF1v77NxsXpHWzdOSDTpZ4dX2Pfdn5KnHwGEDMWIQcUZSpUf
         adMztKfwPR1SaqH1mHgmKiTAQ1BBdd0vUV8ntvZd8i6gCWiW2nq3h9ftP/o0kw60Q9Ft
         ErK9z93Tt+JMQ27lnMZRPAiNwvHwO/DGVvRqpcNt21+o8Dn5NBTek6X5dsXnYk7FsFL1
         altA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685920; x=1796290720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3dcSItid+640QQ6B4SJ+u9MysfBoiq2+UtuyGaK2ZU8=;
        b=HLSDYtsvob6W45v5lUKRCbtF0GqCgtVf4lPGMJoy+1w+2ia2na/ou6NSoBbwI17+qE
         ZAWE3baPDyEjfHfq4zddhVRj7AWhLTiZmV2YdfVArmVEKVzRcKzqwwHqAHzO8+q5t8nc
         4TPcK/trxNm42I3sdnl9rCGrcNNByG0jGv0Oa8fEgML6dteOhxEahmzPP4Ra7Kb3rk0D
         8lErrIwmAtk++VjW4adEVynnrqaI3eyPDbGVou0AD/rwPsosxnQQSCurGhjzRPvUSx34
         TBbbSFThIkdGwZowiDMWXCp3H6EXuhOqd5IXLVjXf9yn1cZq5cAYMSeZfSuIJw8QSJNS
         vZEg==
X-Forwarded-Encrypted: i=1; AL+hErFD9/D9r+CFwu6qbzXD+WiKa56xYPbjG4bLTzRAW9cDfyUAmtAh7SR9qKSWQcb5mqwoZFC0Xl32wAaYwk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vfWRG3YBPq2N/KTf6QdrbjbW91s1/ql0kECNdflfZLI51GXi1
	8grzO4cT8Kb84hwJ3VR8Mv+B72s9+/vvR1IrSfl/4B/XHbCDocZ+9hy8
X-Gm-Gg: AZFdTZdzMg/2WzElLemeMzLzFDSSJcIEBOUNnmA60eu9ImB3D2bbvAEuxTYHb/kpJaI
	UY3Eu4wA+Fgs0k1TRINJwMY3LYrKiPcJSgZMHMemqMhxn/qlZq7ZezT+tKEQGS7rjNumioMBdUR
	RfBMfbnJheKLgb4gLFW4YTEZKMnCFVL2VpYUd0KeyaPTvBnfCNmYRjFmn7n/xi7ArdOiz8osOIo
	AeWikxXaC/nYMgPJyul7GLd0GP1yYNtpk2L/A0BYszhM/muwVLRYv6qpydubsk1qayBIAH3qvtU
	ZZVmGgI9pd2yF9nda1nFIW6oNvGd7nn2jd4z6paCp9Ntymmz8BlgnbvHW5wXO1GdADnkLbOXou3
	9PpALs4K8vwxaB52cBUvCSLs3etg7JI1IQ0ZGKyoY53MRozPI7b8P/E95hkyk0Hgh01GLpwKayl
	E6VjxfJCK1E28UqDj6bE7tJkH19eZUTX0ZvHHDH9ehlLuijUNNDVVEGmTsRcyw3CwlnuOETtg/b
	TaaXBJu031PziNd0BPWXU/YQsoJ8wwXlo8+Dr3MD06TWHwBPiNdjUlvUtGpFtvtAzAYTU3An2Xo
	jMMD9tr1LS4BJT9UwjKlyFBICzNvUGHgAl60kU5wU/oIWfBQfQ2a9w==
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id 5a478bee46e88-3857111f203mr25335643eec.35.1795685919741;
        Thu, 26 Nov 2026 01:38:39 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32600571eec.0.2026.11.26.01.38.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:39 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 2/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Thu, 26 Nov 2026 15:08:19 +0530
Message-ID: <20261126093819.76480-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126093819.76480-1-blfizzyy@gmail.com>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
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

When HPD_IN has no usable hardware signal, set HPDIN_OVERRIDE over
I2C in DisplayPort Alt Mode so the device treats HPD_IN as asserted.
Clear the override when leaving DisplayPort mode, and preserve the
existing register value on boards without no-hpd.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 drivers/usb/typec/mux/tusb1046.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
index 34ef81f75693..50a856c8245d 100644
--- a/drivers/usb/typec/mux/tusb1046.c
+++ b/drivers/usb/typec/mux/tusb1046.c
@@ -21,6 +21,7 @@
 /* General register bits */
 #define TUSB1046_GENERAL_FLIPSEL BIT(2)
 #define TUSB1046_GENERAL_CTLSEL  GENMASK(1, 0)
+#define TUSB1046_GENERAL_HPDIN_OVERRIDE BIT(3)
 
 /* Mux modes */
 #define TUSB1046_CTLSEL_DISABLED          0x0
@@ -32,6 +33,7 @@ struct tusb1046_priv {
 	struct i2c_client *client;
 	struct typec_switch_dev *sw;
 	struct typec_mux_dev *mux;
+	bool no_hpd;
 
 	/* Lock General register during accesses */
 	struct mutex general_reg_lock;
@@ -44,6 +46,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	struct i2c_client *client = priv->client;
 	struct device *dev = &client->dev;
 	int mode, val, ret = 0;
+	bool dp_active = false;
 
 	if (state->mode >= TYPEC_STATE_MODAL &&
 	    state->alt->svid != USB_TYPEC_DP_SID)
@@ -67,9 +70,11 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	case TYPEC_DP_STATE_C:
 	case TYPEC_DP_STATE_E:
 		mode = TUSB1046_CTLSEL_4LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_DP_STATE_D:
 		mode = TUSB1046_CTLSEL_USB3_AND_2LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_STATE_SAFE:
 	default:
@@ -80,6 +85,13 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	val &= ~TUSB1046_GENERAL_CTLSEL;
 	val |= mode;
 
+	if (priv->no_hpd) {
+		if (dp_active)
+			val |= TUSB1046_GENERAL_HPDIN_OVERRIDE;
+		else
+			val &= ~TUSB1046_GENERAL_HPDIN_OVERRIDE;
+	}
+
 	ret = i2c_smbus_write_byte_data(client, TUSB1046_REG_GENERAL, val);
 
 out_unlock:
@@ -131,6 +143,7 @@ static int tusb1046_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->client = client;
+	priv->no_hpd = device_property_read_bool(dev, "no-hpd");
 
 	mutex_init(&priv->general_reg_lock);
 
-- 
2.50.1 (Apple Git-155)

