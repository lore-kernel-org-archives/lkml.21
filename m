Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343788;
	b=XK7zjCjwDV7FS9IsOM2oeWsN+l3KQqfBxAMSDZse4v895V/GqjNLD23dJAJroYGh4Gq7
	 QRoNg70+WiSx44TDdD3y6ewOpZ1IKngokif9kXCwMj9dHrityG3s9TfUGkOcvtfuRRLlA
	 b1908I1qGw8p/R0JZ/pJXVDoHEsJzIFBZJk49B0pANnRTL6kyiaewJ1bEt5apH3xr7RWW
	 MsfBpcxSdOb+53m2OnUibXD7CIdHI8zH4HFoy/Po3lA3lRRS4SQd8hAk8oYaxrpuCtrV4
	 grGADSsKUMjT2E9PcD8v8Yj+Z3mgLcgAz0WDg9CJguMMTMu6Xbmn0oYSO6+L/6jBWNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/jvXQi6RIlt7Mtlnt0QbS4ARuJGb7qPHJ6+jlWg3p4k=;
	b=KAY5UK2mOOxXXhd+kB6Y81L09VPh5pnEx5GsaLfqIYRz7B8AOAeikE4inkspw5irNyOD
	 7beHt30XvBcQnjf4dgJLaxoQDPCXivV2GNkQXtNw90ezdzP62Oupfr6B1O0WCEFYbXotx
	 OBcLfHRx6eGjDbRbYi4tCfR2n2nccQ72FRpgPrzTv2ALxJrL0+vxJCPRhVmv6hmBJOE7Y
	 2YjwI3iuRsy8lT+9CW0Fqqe+cEvMYprRgwWM33RUpoGjoDyioXJ680XZdUDeriHVtHQEj
	 7283suul1mYCkZ1V0Hl9goYRyDsAxVnP5Jfi56ZfLk8VqkAgAvAvspi7pjTL2vtKRNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTrB9kG+;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C441606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C441606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTrB9kG+
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5202846eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343787; x=1795948587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jvXQi6RIlt7Mtlnt0QbS4ARuJGb7qPHJ6+jlWg3p4k=;
        b=OTrB9kG+zDwFTQehuRLEAcN1WkieTn0pOHRiTB9/eh53c3uJmmO09751vH6i/+gOLu
         pgG7l2wyutG7jRl56gYC/AautEwNenET3+/Iapran3yZtODUegFhZG1V9/94yKeRr5FY
         Z4UqzyQ1JB+XAG/8SZByFJKP3WYfZx0dk0uWCqfuv7LYPyXnkVEY81BYhYsILQDZiuGt
         aB4Wwr4b0XCYkS+6oJ5rN0rhgLbtkHLCBODVy9bsmXvayQIsjdD5V3VJHNA1VCjMMCO4
         gYCFWQnb/bWBLN5VNuSdPgfqTQ8pC9kBnXx4gPoRiPbVFFVnx6F9ed8/bROlhoEeYlkm
         HNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343787; x=1795948587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jvXQi6RIlt7Mtlnt0QbS4ARuJGb7qPHJ6+jlWg3p4k=;
        b=dYEeDxGZo2O+kH67usdUMPkqj0gUe777EJVcyFa90L5DsCpsucVoNNNnyFjcUm71xX
         vv/hhVZ0oo1yBaovgBO38CCaNCbhtUvPyaVDaU3js8Yk/N2XH5CfbN0uVnbRDWT2PfhR
         zmnQWL2Yei51nZGl8NPIShMWrZ6aDUsGmX3V6JRJIAxVYy+LJZ2b1Qb4hQComchTVN8k
         Ys/A7Kke4c5thXHbpHGI7ChTIp+NVFJAJ7x271PhVmlPURSUa4fC6KXvK1P+E+Ie/UPB
         fWkkg8G9WTbDdjo1jVwf4KfRFBY/+LUkqN6FIFL3nCeh55TplfwUHl3p2T1vHFaJPuyF
         kWMA==
X-Forwarded-Encrypted: i=1; AL+hErE/kbW3gSNZrUEpFssptpjlpP/vjxVvjtkv/n/EPVdk7uGMXwFKJvlvPkAMSpGFqyubAYjVSGtWEX5VpB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z84SjZ3nenMzDyh08J48ABc4/AdhCDYEH5s3IhL5rJz+ZM/Vzkx
	q/Q/WnS43UpfMQYW2mYarThhoW0LLQkjduVOsCJN7VbEQcvwTmn5Fqdm
X-Gm-Gg: AZFdTZcQ9uGYgsmENp2kdQsTrLURB41Ss7R8HxEwyNZGakv4GfYPZeogMitW6j1q8rh
	IT31VeMCoypsq98Diq9aTI8g/QQMXAmhjEiin2feeibu9+H5iKPbiVMq94+hLsA2KvFRfQl7040
	gOc+5hsJYqojka+7NhRaXgG2UYlHtJd3cl8YKX4uK03yf6NOESPsJve6ADNciYt3e98auafNElP
	pExUM4mqcM8KA+GUtHEBPAr/BGO5ZFe8qNoYPcrUQDu1O5ijjrkJgyTms67jJQVgxeJ4fDyydSf
	Vm1UkSK5U3343AzHR+XLi7xs/k+VVzR9fmO33ahSQAEishWBMeTyxzF6GmhQ5T7HR/aRWIGXHDz
	pppSPhdc8vwHy9zOSCySEfTa/JmisohdkgHOF0lymr01Dh6acaRNTpcZFYG5SwUo3vDC0/xtOfL
	k78H01J+LzALnwlAoVVEU1yoH+6wczALXap7/l2jZ4pBxnkzGs7ApG/Hu4nFInNjddpt4jd187Y
	wgSd0EVcFKiMDgXx8BcYwk6eihA5hOJb/Z/6M1kUHQwTMZzUw81vVd1TvkJF6g1MYsy7oeVr2Ug
	C3q8JeZbMvvCTF5V298tgl35/6jnyINSauBkXnbk8/J+P4U6G5LgvNYHRRQfXEmdwSPvoWfMoAG
	H9VCk51zH1P4i1ZxLggEBuYL0Y92is7WMUzvaACfM
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr10341532eec.3.1795343786729;
        Sun, 22 Nov 2026 02:36:26 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm26176803eec.9.2026.11.22.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:36:26 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/2] selftests/alsa: Test the sequencer UMP MIDI 2.0 RPN conversion
Date: Sun, 22 Nov 2026 19:36:11 +0900
Message-ID: <20261122103611.3264343-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122103611.3264343-1-sammiee5311@gmail.com>
References: <20261122103611.3264343-1-sammiee5311@gmail.com>
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

Check that an RPN and an NRPN from a UMP MIDI 2.0 client reach a UMP
MIDI 1.0 client as the four CCs that select and set them. The NRPN data
has low bits set, so CC 38 is checked as well.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/seq-ump-test.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/alsa/seq-ump-test.c b/tools/testing/selftests/alsa/seq-ump-test.c
index 55bb7ea5b02f..7030d061dfae 100644
--- a/tools/testing/selftests/alsa/seq-ump-test.c
+++ b/tools/testing/selftests/alsa/seq-ump-test.c
@@ -620,4 +620,24 @@ TEST_F(seq_pair, ump_midi2_to_midi1_note)
 			  { 0x20913c01, 0 }, { 0x20813c00, 0 });
 }
 
+TEST_F(seq_pair, ump_midi2_to_midi1_rpn)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, SNDRV_SEQ_CLIENT_UMP_MIDI_2_0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_UMP(0x40210001, 0x80000000);
+	SEND_UMP(0x40310203, 0x12345678);
+	EXPECT_MT_PACKETS(2, { 0x20b16500, 0 }, { 0x20b16401, 0 },
+			  { 0x20b10640, 0 }, { 0x20b12600, 0 },
+			  { 0x20b16302, 0 }, { 0x20b16203, 0 },
+			  { 0x20b10609, 0 }, { 0x20b1260d, 0 });
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

