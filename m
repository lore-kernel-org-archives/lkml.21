Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066697;
	b=p8YdKdJW/0mB7HCvGZuCcwinzgb133jridIrNoMcMTMrFHUY46XIssu2Ofnytd5gcNO2
	 FewBPdfQfoDzA6DfkI+LkcorGU6eiFracOXHe0wUDQBsFsHUgdvQDh/95VxU+c8+X/MB5
	 zwCHnjW9Pi/Dw9dKzz0AjW76j55Snbmav8XGflS00AqLFuqSRR2sFrw0+lGFbS2I9oVlt
	 2j/eOomuDglvCmG56I1R+EotEp1TnkujS2z7pc2O6g7dBVRKOMX9c0DxIuXmZPy90pyrG
	 VdkFBf6qP/QRuGCQDefASBYnfr14hDQpqVUgJMufUGaqHZjn/ld/DHwgQXjhugY7raQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NJwtMsof1yNVRlkOI64mZgUWLXJ+UbMqtHGUp5escDA=;
	b=NjKBCLOtSEnDAJIcdjUe3KQHsgVTllBre1GoPoOLkdfxXJfyTuVOEPK1ToTlbbZSLCkW
	 JNnM4yjrgnB7VTYN6/6biNazAdMpJJjZDn4h7HPHSjnTzTgxXBrXkt9VLqKCt5sCjX4KT
	 oy8y9wBB8/N2m8TPjF/k9MJS7rNNP+HY0mUxH8UovV8moJ/45xWzJ/pnkuLb/rA3LoqXF
	 rpNHwkW9W+hC8+zlbSd32wJVCFH+cZWxu+cfDb7SnrxYO6XjfUnDmYH6iAbvusO9agNg6
	 i+xXHcIFsOxxO11/OdaeAQv1+z19NrwKo8ahmU4lhPZ7zKr7VxkwO5PLUDjK2BmcGlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5s8k2uK;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939FE606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939FE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5s8k2uK
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490f38e9688so400475f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795066695; x=1795671495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJwtMsof1yNVRlkOI64mZgUWLXJ+UbMqtHGUp5escDA=;
        b=p5s8k2uKzat9cHMJJRMBfbU5L1KpVOw1oCQDa5K2/ZeSDXnbKyEVrYc6flFEXCjCen
         JHFuENPP2UUmCGhFqKB3ohVyQPafVHPjN+yGHtBjWJvqeU1fCoU4Eri+dew4AnnSESA+
         rwSVZ4KyQszYMnxLooDltbz1l2i4TKiOwq2q5zO5YznEdhIlQS48P5YjBNq5lDPVHhis
         MH+c55BgYQ7ITz75kavRpm4XzmLQsLDiyubOWat5DFZ0u7+KyQlGRG6GLMTgeXk4hLTD
         ha83bmZlcsjRgTpO9Yd5bPIE+k524p7tJ/I/2PMu91Wg5aCzpH1iSaVGLtIhrasI3K7D
         nVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066695; x=1795671495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJwtMsof1yNVRlkOI64mZgUWLXJ+UbMqtHGUp5escDA=;
        b=EBaebMAEUwgygKtB6FGj0M0oMvcQFv1udZKgQnrZB15psbszG2KyXtv2uwG6lkqM8+
         YW5HHyvR/m+byJl5UJSsSeavnz7FG/Y+IobdEEw95pNFIXdXoMxU3vDWiqc7HZhSBDpC
         jbA/cA4Uruz0yIjwz2oUmu4mL7YldGHDddDQQUpN9SPnESURVmpATHX+r7e9nF9qXvFS
         K8UQYpdAAAuLSfZELkvjEdV3k2GxfUIsEctjSrnVO0C7aizc3zB9aQT8mvTgkwGyWq64
         dy7AzLuUXA9AXqWXRcQEw4ScsBicjCLJxlt0a+XtBu4hs17Hcz8KrqTh9FXV7+DRlpSK
         tijg==
X-Forwarded-Encrypted: i=1; AL+hErEd9BCkApw0FeCmgl5iWLXYBHEcevdFNxdzDFHMK/lp3LGIJ/mrAOFdqLTF38r67Y342J/SweQQszZ46uo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bDMF9edwKNyHwoUgXeDaJNvP0Xi/KvhjC/ZfkvagsWcVVdN1K
	YR6R8Im1mch5Lt21fnVVUwU7aHts6B3HZOIRsDIK4EZX6POhsK4yCAL6
X-Gm-Gg: AZFdTZerzB+08tbv8ox8PHZtVjII7CdlQ0k/4InQ1wCeIIHl9h+JOxmcp1AuOcg8v0J
	b8TWPdv1fOh7ITY/rAo+FhEI81tGSOyH9DaLK1WwHE0+zyDA+I7ndXOK6VcwZMFUIOx+GLYZOD1
	qf3kexPWk+d/bJSgwWe6aQj80gJCiSW0rl0qb1xv4g9NM9MHVFuOffgSz/OQyo2PPwRgMWaskdN
	huukXYKOsfz7OQRrZBekvhapS29BnIXqfv0FOVn/dRIYK/hjLEEmIDCqxlp/oIKXxPkpqQhsFyM
	b8Ue0U/Et/i0CKBWrEai4bhGNOlMlCEITn9MrFYV5Bceu3pPQ6vnZYeYV+zPnYCA/DSAG6fZTfY
	2LdsiJ3FaqgwByGqBLdPg4z37tcrheVoWRanNqEFUHguA9lE/Y3A9RzcN1JxteELl97iEWxvTgK
	5p4kIq1q2OJtdKcTEz/2JuyWFMrd8aJcTxDR24cbRuUFF/pZaPKvIdqlt3AOSt0AXHhA0bPtzI4
	X0sRxD6d3GQitMy/ybB1sLqmYpAWL0oaNa8fMS+ekXvjWU9p8u2KI1wxItrOckIdTe3Jtxd54vg
	SfucUb4+rTzJNDimjh4uWdp6zqSqmD76bSY=
X-Received: by 2002:a05:6000:2383:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-4aa50f2405fmr170360f8f.8.1795066694865;
        Wed, 18 Nov 2026 21:38:14 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm9200091f8f.8.2026.11.18.21.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:38:13 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v13 0/3] wifi: rtw88: channel switch in AP mode
Date: Thu, 19 Nov 2026 06:38:12 +0100
Message-ID: <20261119053812.2435837-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118231940.3950-1-mehmet.fide@gmail.com>
References: 
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

The build-wireless bot marks the three patches with "Patch does not
apply to rtw-next". That is expected: v13 needs patches 1-4 of the
firmware recovery fixes [2] first, and they are not in rtw-next yet.
On rtw-next 0bdc579dbfc2 with those four patches, v13 applies cleanly.

[2] https://lore.kernel.org/linux-wireless/20261117171003.1840491-1-mehmet.fide@gmail.com/

Mehmet
