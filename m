Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795268314;
	b=e4r78nHbuRBuLhpLLRV5Q0Q5wnYbaMbW9RmL5T5zdImSWmmCU3RNg3mh8YVYR7oQNIRe
	 opmIv+Bsv5w/s4EJ9U7QebXDQMvm8MsRrk9G2YGIMKRIfRicouRjfsG2IKORc1/wJNSaG
	 rBKPPLgopYYqJwvo9us0TRnlySzc/c9aG91l3TiegSLXFHVLb4X1ABPuaiGrrCqyk4JMR
	 0ymBfS1fkjSIe5fsT9W5d0KjRMYWUwV+9nsYOYGiPbSszV3rzHcSB13JoiBaE3a2wHlJ/
	 +9fqFzVhiIoDQm1puo5QSRfgffNNDhjicpQ3yiBYrkjsN5Y1aaRhkBUhY942LBE3oUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=2JcSkgOAc70yUl0xOGsAkRmn2yrqWyaYEB22eRFKz4Q=;
	b=g0SThnSvVQ4kDHzf0xBf4U5G6wmGLfUxudfR8xC6iymtkuHu0zAkQSBZ3fCGM7lcfIFR
	 6DdBIBwUcFNPFabxaC3cn9Zz4p3qPO1u0InH+lel6CoTTTHncwsyL1uqCEaytFvxybpG3
	 sTr3j3jR8yx8mdgBTJp7z4JfILp5Nofl2bgXdgr7tl6h+kyafH5OU+wQMaaSxFbyDNVGC
	 SKfC0iSCehQ+bRGOnVjZu+PLihg5I1JigYs3T0YELGYcCB+LyxnjLMCrJ4xUcmVrNybso
	 3tm6m5X8bJJsvI2XppsrrKIAo/a7sKzb4X0jdNwEDrhv/U68Lp0pOviVf2rRoknTpDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NiI8guW9;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53F3606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53F3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NiI8guW9
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso896640a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795268313; x=1795873113; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JcSkgOAc70yUl0xOGsAkRmn2yrqWyaYEB22eRFKz4Q=;
        b=NiI8guW97trs2YALHBUQx5HwUu1q8e+xkO4IqLHlA4TYdHvu7rzrplXh+EWPxIKrd7
         z9pXZcroA89w541dMTytKW0zYAAHKhG2OQG79hskyNXx9Ops5jcgk48JQUCJjk8zfQ5/
         rG2dSVnCXgjNygIlV7c8yByNBjP6yj4vyKtWFGCG5VUlvRZI8Ee8H7rF9Q7BYZZCRU7S
         VE05mPAu0L6B/mejL7DpatGB2CpMceBiI+5ohCWORZ9wLBvpVugXnNIOI119HfeK4pG7
         9QmZNgHPcUEE0pf6cCpXVyoEhO0zjI5MD3Jpb9m+PYqHS3x+fJ0cERtzroQmpFsQxNv9
         geTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795268313; x=1795873113;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2JcSkgOAc70yUl0xOGsAkRmn2yrqWyaYEB22eRFKz4Q=;
        b=h93IBtO9Fq59m4PbCYJ5GWGZw3DhzTJ9NjfLDTAEQxrYrab6EmZ6MXDIOkNfxnl+ek
         qd1aQSWCzYym8FA97mybUUSdO6oOP55FTX78u6JYuMKkdxCWSCYFV5u+3gkVnhpBAQHX
         C9RTCapZ/F7eMvEU6SMsGduRGZ5a6OxtJsWQIWqeOW/ZyVSskWEL+NPy7MPN9nK2sRxc
         FpFv9PioC2XqTwLuCCcpg3cMPe48UTb5fr97pj+PfN4x2Ecxh/MHkOIK19fxphYO0qPC
         1B80fDV6/uUiUFFYyKCUZHe/J/f8eQCZd/liQkrfUX3QHl/UPfDB1PbaJJThIcIKUxxO
         9fNA==
X-Forwarded-Encrypted: i=1; AL+hErExyb7AphFvRIKiSRKJXE559UkaFnEea5lXiqI7BN5ok14H1PFFgVNcQZ0p2uHmzGaERPDTgYpIzhg53Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/akDuizxw/WugWv53ckAlGmaR5grw5VC26+PFzI1FyhMPAEta5
	yFaR0IjZ5EnW6jJ3A7JFAq8ivmDScor4eA2+lq9GiDb2Fy1K3/fozmmR
X-Gm-Gg: AZFdTZeSKmGhn6Uue9XtbkCs9pqVPfvd1Vnp433b/cI6HldoxGgd8AiUHbdR7HSYwoX
	ChXenBSEFLr4srHQWYzVa6HT0rsVnSgVmKmzfh1KoMOFSpiQa+86gWi8YSa37ahbFrMCvKz9gn3
	Pb6JvR0xllqEdNB8LV1W4dhM/m4iHg6YVHq7JL5u42FkxxiqTLpRrPQbrleDQ3zmcmZIh4nqIPu
	GxumcAd4Myat9FXA9v/gn835veh7bmndHAd1gDb7XZK2FckGaSaIK5LyI57wC3UJ8NQc5dNGlva
	2bKGEavxK1ahUqyq0LF5sf2gMTW2okpGJAQN1AWv1EYBTmaCwxIrZLI8wq9AIg/Ju/eYfW/C+0Z
	7aCZ0cP+kJYHkZJER96O845jxoa2TqvVU2bdngldLKdojw3Hd0qC5IX4ldP9ujorSBi83IBBG2q
	g8lwGzCY9B0m+HpQt7TSyErD0NSTUowMH1bWhMJduR9H7Qvs5lfDhOdwQI2U43jyPuiVDlQCRJ4
	zYcFMkQoXbCu6K80JBskj4yZBqAJsuKBO7lQhMil+CM09XVkaTUyMLhsJ4TG7B18mbk6+Qj6vgZ
	+O4J4nOVKOBpgdFPacxvL6Pwwhbn112iHoUwEXNy1f5yDG2Z5MwGIs7voxmN6rr35H/JAMF4odk
	=
X-Received: by 2002:a17:90b:2f8f:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b41c938926mr3785656a91.25.1795268312893;
        Sat, 21 Nov 2026 05:38:32 -0800 (PST)
Received: from DESKTOP-UCPRL76.localdomain ([113.200.174.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7f4899sm2032844a91.4.2026.11.21.05.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:38:32 -0800 (PST)
From: Zheng Shuhao <viennaoffh@gmail.com>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 linux-input@vger.kernel.org,
 linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] HID: hid-sensor-hub: avoid lock inversion in
 sensor_hub_remove()
In-Reply-To: <20261120210317.184756-1-kapoorarnav43@gmail.com>
References: <20261120210317.184756-1-kapoorarnav43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 21:38:25 +0800
Message-ID: <179526830578.567.7445109567862298713@viennaoffh.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Ayaan,

Hmm, I overlooked the latest discussion, which caused some overlap between our patches. Sorry for the confusion.

We can merge the fixes into a single version or find another compromise. Either way works for me.

Thanks,
Zheng
