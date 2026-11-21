Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245400;
	b=WlbJYWBhfywZEEJL4n+BiRfjOd5JVFF/WModcHgJdBJIzqw3EgGT2WFNNTj41BBI7/yw
	 07DyMllRIsDt5vpwiKeToWPcxEmPYe2KfzacMIlYVXPzg4fQ1UTIQuDS2kZjmTA3IHocN
	 6GYNr1A5WWIscsMR4FZ2oseIErX3TTaHTITuN/Jy5uVVi2oldlKOWefnqeKzr/JRU4K6r
	 KVK6wHTZPEI3QgZ8lqlBzoe3pDUwRyiOwYG4slm7ArsdyHmJQsUDnY1/+iUPX1wVPL3kP
	 3LJxUC+WhwvoVg8os5LzY7j9rQipkHB6YVJFoGeXzIAqVrTQrUwM7oz/Dfnn+BJBF3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tdCP/mypa2/iILqauJ+aqk0pnjBkqNtJg4KvWW3pS9w=;
	b=lahgp+kmSLjzfh/6I+UMs9dEzRl1vs1CVTJVKJUqT6G/3h3EOw/t6rn3zv2vxA+sP/yF
	 OkG2HSh7Y4pN/u3Hw82WZ/BdTqbPHk4QRnfk4P/MfyRWJiXuw8FwbU6t5OstWx0BZ0HeQ
	 EfM/EnAZWY0UT7trANfmSCAG71ZWcZvEF8OAiPZXwTzPcn1N4ODRmzkTw9hg/S4ch7ClO
	 ajhOBfocA4L892dcjug80p5TKtC946Ojtrtd2BjP4rBLQXVmHSfMfINxP/o1D0M8UVXV2
	 xKvFsVB4h+XS+Q9OWjh+h7xTgWU89WToNUKYAVnVUDswrgGytJdOu8sffoRVcOEH7xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALSW9fU+;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0742606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0742606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALSW9fU+
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b24f4b15c4so988452c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245399; x=1795850199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdCP/mypa2/iILqauJ+aqk0pnjBkqNtJg4KvWW3pS9w=;
        b=ALSW9fU+n3W7WmoyLRDEW2909svEnnBqGvBB9cG9yZ/vOis+U7SRVFVylleCZCa8sb
         5ZXoP8fiF+muBQzltTcfBo+UPr7T5aQ/+nWfPEWlBP330dMxWmXMKQhU4ew6M4LVTR22
         ntMADf8QYuojqJBCPE+XjTEjXo/8vsacNLvD1YRpdrkZVVYi+S1yfebpusA3GN3CRW7i
         6y5SyTE4O8El7uNqa1NBQRGTB34prlSZk86bIndJIo2vvIqkp1Yv+jUTu+szuSmjEk0q
         BSXv99fJPcs5EGS5rDZU307/FTMuuC3D4SI1uh0Dqzs1xyU8LprCmX64uDFvE4a+l71Y
         Gnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245399; x=1795850199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tdCP/mypa2/iILqauJ+aqk0pnjBkqNtJg4KvWW3pS9w=;
        b=ykw/8xdcuudDy7m/h1XH30P5J0Fbx050lXbVSt9TIEJUZGV0i4Gd73XvIvNYvx2L7t
         7iF9wNaHAwq2v90Ebe7WZYN6AZjXVNhZPZ4FYOUUtwCZ8eIXSkhbrLgyh5dVZ0qVs1n7
         6MMayelH9I3Ofow/+ntRgMJoW7DKu9gw7kntFRlmUWusssPW2LfJ1akyPIxxQvaiIjGj
         IB+2Zd0nDx52PiSSzWfAi76+r85SuTP+NZ8YdzDkaGquFhcW8t3juztMZ45BVdsv/yD0
         105tOivVjlRD0f3EWUiHTFfvMiHNdJhNV+cc2ae38nWQmZs1ll41pvDGOubdfdSOoFpK
         Wuug==
X-Gm-Message-State: APuU4Z/+wA0j+K+qOWwFIRkaoAlSW1naU5EbFz6scnifeCkx1TtXs0Cy
	2Sqd7ewZvr3Rg7s0p+IxpwccMHAyn4xOnvEAzQRLuu8ARPBEczlmHbWb
X-Gm-Gg: AZFdTZe9z4xquVcbTRDhJ5ybxmCwb3lT03ggLO9Mn4RNIdXjIKop28UGCwvkv4W6/NJ
	CvZsv0GWEii4/OmqmDc3YE0McHZA2aa5SmsjFEcCbbCm2KAhOv0w7zc7Nh7wXYZTGSRuTZnN+69
	PuM23aXUedD6vFdP3AqYoxoX1VGBTJC5Xhhq2EFbheskruZoaBlGLFSkKW8j9H2YYaLjBKqwjOM
	a7+GtIG3a2j5RDXNKcl1MaefBgCHW9ueKsv/mhmUdXh2IylrHiOs+1ZnPS7fbafl15/2C4+joN2
	nJdDeVlFCupnn4aKdtLkTCq01q5EOPgFmNkitjyAXJErN07hWPmloCNydcZNW9aQ8yr8t0FAn0z
	fFWO5YJ53dv8FuORtyFI0zTH0axxA5ZIVwLIH6yZVyrG1mw2+t/MArO0ZulCAoLd1K0E88oBOKv
	7pX8iWos0lHxUKoFqGR+w9VDaZQvSDICnTtmHC7pffufyFfQCmSB1qFiOkJmRuGZC0ZCdHX17Yh
	i1fuvprsOEVcwMkDoWsRsdV/ePLQXpAiGsBuHspx2w6KxDoeja3Y4NxkNVeVpIx+0ui/NDV0cTz
	nnTa4QGCMZ6ukJuXdB2imblMsjwGU8xKsDgOcRgAkTbINm2DEqA=
X-Received: by 2002:a05:701b:4551:20b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5569167b4mr4993441c88.18.1795245398780;
        Fri, 20 Nov 2026 23:16:38 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:2f:4d17:70ef:2f53:72ff:31c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm20880373c88.9.2026.11.20.23.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:16:38 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/2] platform/x86: hp-wmi: fix platform profile values and fan freeze Victus 15-fb0xxx (8A3D)
Date: Sat, 21 Nov 2026 12:45:32 +0530
Message-ID: <20261121071534.28473-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1061c0e1-9e05-a09f-3eb6-5702f4fbcf08@linux.intel.com>
References: <1061c0e1-9e05-a09f-3eb6-5702f4fbcf08@linux.intel.com>
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

changes for v3:
made patches seprate for clean merge (thought it would be better?)

- v3 changes are mainly for fan freeze pointed out by ilpo,
- added a bool in fan profile params struct 'hp_wmi_fan_speed_auto_reapply', created a new 
victus_s_ec_fan_profile_prams with new bool. 
- also made that bool a wraper and re-made the 'if' statement with it

Sourav Nayak (2):
  platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx
    (8A3D)
  platform/x86: hp-wmi: fix fan freeze during load for Victus 15-fb0xxx
    (8A3D)

 drivers/platform/x86/hp/hp-wmi.c | 44 ++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

-- 
2.55.0

