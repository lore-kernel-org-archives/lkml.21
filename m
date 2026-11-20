Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186820;
	b=bvbR7Z4giQkq3if1as0UigNAsS1vR8xZlbOTfw+c4ApP5HPi3tVqNZAroG55df3/8Ql+
	 Plq+AszEDJLCfN69ovZ2Q6c2xYiuFmaEWADtgJJgyST2d4D+/cGgLJm5OcidlldAHm5LR
	 dxfFtzS3brilZUq8+zzyK0o8ZRdIlthQWAgAp8EmUkl+cpEqBDCD7Nqy/ZxcRA2fcv8V6
	 s2WWDkAxuMlPNIpOXbj6SOf30VA7LE+yj2YIrX2V334FJzsU4D4PxsQI+z3jJ6TQ8LgC9
	 Op3zebDoaHwsYSoLktVHBGwCinFd2q6I4HDNK6eEigIgGrkEH+LJw3j5mkdztABvSdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pEW6L5/3vwL8JocGYWFqUuSpQbz1WLUbXyb+gDrb1+I=;
	b=amhWXZ+OpqHc1/bMFPqsB7+q+ZtBNLNKxZ6V0doxV2y9eOXy4rko6jnJhqA3HvAf+V2M
	 XvxsbONLvseNt3eObmhgylWCzE7vpbp3VigUSSY3UnEDcveRbNW1xE7cIlMW7mZHUP1O7
	 IAPHcD+SJAUste5sDPd6psMVzYlsGlbYX98jkNkzYXSmp3AupBNmxHg2MabmRDg2qhOXJ
	 HKqya+uuTKUKzHMl71k9kdlA8sz6rAFQpY6czbjaoIh3VXKA8TjGQPbfUdFFtKgAMLZ5I
	 Yz5eyFuX4tdqwL7RhyavTkOFov2Q5Ofbc43oVi1CKEd027dcDX+nQwGrRpNTPACXGpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l483reJ1;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDC60A6F63
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DDC60A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l483reJ1
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso1305509b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186819; x=1795791619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEW6L5/3vwL8JocGYWFqUuSpQbz1WLUbXyb+gDrb1+I=;
        b=l483reJ1HSfaBFm4fY0MTe/lry4/P5sQoGDW60yBak29u2MjUQUk6jITVev4xtuvVK
         HbpRptwY/VYAKrKehfe/lAhEDOSd6+0XcSopFWIZQHIZBJHK0/jAOl8ZCd1oRWH1XjW3
         fIIkhhhxrttINQ2xTjIw9ryiJM8IG+e0rcBD+tWlPC2wNFGl2K3Mch8cQq1ePQjewAfC
         WqnuxjdNZXnbMNALHVYSA+O8CfC5c84VqT38rNPpSHD9jEF25Et6dlSr1B1hXoIN0kBn
         1MQ23u2q7eifkTSgnocjKLtDrLMpC5CuDG4igoApUtDz4UBoIrK/7ITdz/heejG5PpmB
         GbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186819; x=1795791619;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEW6L5/3vwL8JocGYWFqUuSpQbz1WLUbXyb+gDrb1+I=;
        b=P0U/PXz+7dCxoK9wUCwYsPN2cbBZRIrliNlOey34xOJPLALxoU7JfLuby6QUsVc4Fu
         +uC6SOG4UyI8m6aGp6ir82CzMdBeWUvhGb2j0b8KCCu4NGZfSuELyVNiiIaEr7PmB3M7
         jA3pIQhNHI6EFcbE2iy3/EaQmFKGbVXsyPNztlwparkoiagmxL4FjlLu//o15/mD/l+B
         w+TIbcnSebHQDMV1n9mk4NDwYbs/+bd6N9pO4qX+cE1P1yXZKAX5/fAGdmssVSfUzkV1
         CPr8nglpwiCSb3Mp/Kn27xInnX4CH9OaaoSgIn41hqBnCqYdhIP5IiDiEN/6GygysFmn
         tAcg==
X-Forwarded-Encrypted: i=1; AL+hErHS2kUcOqssGRxaKu9vsdRx8KnhkTBX4+BtTuVHgMUoCUBBBWqjFzAGko5kU3QyU5/+SP3dmQgt6YSB6n4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+AD4bdkYDh2Oyh1R+I81YtmvN2ONu6jqHxjCv4mQIoZ2XNI0P
	TMfwX3VcYjoajtg8Tw2RX5zRrcRjczeIOZ5uQKna8+IL8DtxqI1bKu9qfrxelcVqi7o=
X-Gm-Gg: AYBFou2JQ5nHt4zRGVhj7aJQOxjeRPEZAdOaneAzeL9Az5Oq3wwyMD6ymgCQL4mehoB
	ceGlUq8pprX0lU634lmlIhyrJ/r2ibCqzeWxt/xSKZztK/ITsZJKq04bSU2cXxlDY5ju2ptGc5C
	Rb0oleUEPBzW1rg9PCLVKGdGG5AUYA/NNppy2YmB2YTGCN41wiVk7r5fym7mksjFAZ7tWmtQWW9
	GFxl+ZgaefprU+2NTsZB71Dm1HH/P/VlvaB1PKfPZHYdKdDlrm6gVJkLHytqeaVCnphc3o0Bh5o
	xI7vzbRQblqJXTJe5gmSnS2g6+T0d7ZSrhkNxWfIExWY6bWZgjjYR4mVLv6Amm8ewnYh38nErDI
	HbIUZRS57N7eSwqyO87pQLQdKzaG2n1EosfqMHtYBgpk3YvVv1FHD46Ms2hD4btkns1PN1vfUkx
	T29IIMHHQRvv9tU4dmcA9NHAab4otL3kWfHA7Hfv97Fhe4TpAlJQMoYhRx3fLFl9kNQ7/eWr8Q6
	cxC2cUmHEOKnTyLqv3Ty7NTyzjgQKrnhoH+dHGBAtNifi2iz061sRXQ+9la9ix72s8PMrAmaxFP
	ew0Cq0pZpcxTwvOmGl/hnr+ObP3IcvKBsQzm2WUug4Mm6GLUwgEsCBhEFvpYigN1AHEHKpf0gGi
	p0cyYtFhWFqNJti41BEpjp57lFJfM8Gkujmbs
X-Received: by 2002:a05:6a21:3b8e:b0:3f9:16d6:f227 with SMTP id adf61e73a8af0-400ad19e5d5mr3975394637.10.1795186819395;
        Fri, 20 Nov 2026 07:00:19 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc80d4sm1462545a12.6.2026.11.20.07.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:19 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Sat, 21 Nov 2026 00:00:14 +0900
Message-ID: <20261120150014.3128138-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014011808.3479480-1-yhlee@isslab.korea.ac.kr>
References: <20261014011808.3479480-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 10:18:08AM +0900, Yehyeong Lee wrote:
> mvumi_hs_process_page() takes max_io, the two command entry sizes and the
> list depth from the firmware handshake page.  The entry sizes are u8 fields
> used as shift counts, and 1 is an int, so a count of 29 or more makes the
> << 2 applied to the shift overflow an int; a count of 32 or more is
> undefined outright.  max_io is a u16, and the sizes derived from the shifts
> are multiplied by it in mvumi_init_data() to size three unsigned int

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
