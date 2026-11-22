Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358169;
	b=QlP58bHhSRGHLQZ2O/Ey1vH0QsP54CWgppgVeS+KXH61j51XGRlSXyI6eY9bCo3T402m
	 BfSJfi8U8GAi+6nshmy9HxURtTGBvLerSBI5qCbwOckulIAKfUAm1UqxG/u6bYYmEEX1n
	 sTHk/MQvRnjy9epIVATZed6zA8muGyOu92FnbOFsILVQPcQk9JZticBtdNNTTD/sylRnG
	 gyPL2leAjFC0HUE9Lp9tX24oOJvGQo7ZRh+gG092U6BV49emPne3IXYe4aDI+VibA/0Qf
	 PNt1HwHHvM369DxqEdaAqQLnOcEXU9v11leOvo2XPjQKv/+tjt1BN0POZdruFPumQ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UwlgMhtfF4zQkD33jes8kjf3uie033JQr05RFNboNL4=;
	b=X/I32KzR5iAa9T0YxmJ0KczGULYNichYQWK2cr4c4GGu+V5B6hkZ7PvUAtlvPumPKPJ1
	 STNQAtm0pfmlJBLDu+oWDcDZkjc8YPBjk6QvXatuoqDKejKm91uqzOvERHn5pc68VCLXe
	 0w/lDd34XXkD18fceNYXgKCk6iayZJ1hw9hj0RFYeec0caSrIIDABSjpac8uUdFIN2u+t
	 gdXAu7dEjAg5mZvIbpm91c4QTJzyBphKzOowucS0c/uHjoiwh+tB4FOgbI8mv97kS4dAy
	 1k0PzoO1tBLIoD7063mWIn3XCZFmV/HqT3EkCisypBOxKW+C3/MmZIr66MyAEqHIeJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I3PtcBJ0;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31DF606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31DF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I3PtcBJ0
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1847679f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1795358167; x=1795962967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwlgMhtfF4zQkD33jes8kjf3uie033JQr05RFNboNL4=;
        b=I3PtcBJ0exH2ZGLGqWA4fG7e53pi9gjgl9qRJVQMT5ixEAMFvDJ4uQcVCan8Ca4k4A
         in0gcxUzdJ4ne86ycH0ppigAdD74BYWiyB1Fj1YhHQG74AXBw2gkHGBZpq6Dh/cH3Q7P
         MGKZ+znutUY3HuxokIqmOzI6mObUYb4vpgkuFhgg5vMOovO1lUORdDtqsFuBMLKH4zmf
         JqTjxQvu5PAZZc3O8BSzk+KDgEZPB2NydQJoSA9wosjG362XgqiFItafV6KqRvZfhoME
         Wpq/pt6GVmnxc49G/iPPLwIpSO1qZkDLqqNxwmSADfWhtuYfJjHJ6VQl1rqZj3y63LoD
         HhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795358167; x=1795962967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwlgMhtfF4zQkD33jes8kjf3uie033JQr05RFNboNL4=;
        b=NOJqZff3pESVGbDCnK+Ky0xmRCx/SAslrMLrFqQ51CHq7W5XSOqbkdeKkP0fwCa7fq
         bgDv7cW4fT8px2+xI0PSwUQoAI83vmCwVkfuuuMa98yu0W6fDJ9o2YByW2u6xvZTR6my
         4wq8aZBNLV2ctVGrzdGdTgkqxcJlr5NKQdcmyxD3f1sbiJ7VUnJCkB2hVqrH0Wht+v/C
         Q7g6ulY1xws1WufIwcioXUkVcQ8Td/nfA192c9qzr/XxDprAebA6PD+sO6ZjyVTUZUGV
         cqHY0fMYMYpCCT2An09wxGYLodXT0Yr7TFcMPzKgbQnPXR01m4uVP8vOdm//jWH1j3y8
         1hHg==
X-Forwarded-Encrypted: i=1; AL+hErFsr09EJ9nzBZec15zH4zzHEj0pkprvNWKOJWJMaToQHyaiEPLd+7YRXBVPIxWOnYIoKQqPaMR7nWmcHV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9K1s8ZvMMMVgSIiIFwp+ecmbr+DZ1xGwbRRU0bPzyWwTPKQv4
	ftOaO9mwekHgNRI+KSyT4OIopXoJQKIeKmxBUYDUY9ficEw4uBquv2+oOKSKwVNKJw==
X-Gm-Gg: AZFdTZc6pDiSHPUqSCbbCEKI7KBeNrxet3HNnCHjRuYmBTs2dP7VutfNHWlNqQJ9mjH
	GEa/bzfYhezmwt+ofXAeE6riC0kpkDJNyrqoYyYQOvLo2lg0KNkOAntEkyn7KR9hRVTJbAavB0G
	fEA1NbQL46yQ5bGHKlvo/bOzjVzvqo9AZZGU0jL/x9kGD6+1RgYrXYnOeestFgMhsRVW3ZdfQq9
	oIRrgGRBRnTM49MviT5YDmlvK6Xf84cpNvWSlvNpYMlcAbBZrpqdWnYQ1D7p1Vl8Z6ks5ndcY7T
	6OiPOzvbUE2kZl7twCu4kZOrKr5JnPM1lmOOvRllQMHXHUrPinW0AndwinhzylbEPgOz2dwvjF5
	c4d7lBKVSrslUdfB6cRM66SqC6xh77LCGCO2D2nPKDtnat/Wri80W03t3lnarNcDs1r3OsPJ47p
	9aWmuTSya/5B9HBhOmEd2YKchypWiKWro5/GbO6HoUqZv8NrmSPvKKjnFjFXGx2QoPZhNBtVxSk
	BDrQ6n1wPtIygUSBKtQiIrswhQXB6iUKU6D+vWP9CLgIjanIpP7QxqeoL4e7KIgDKrGnHkhK9O4
	4v8XpkgC3Z/mlknbXb1WSqiIgcJohRaQT3vWm6nIV+IoVGTDhozhHLzq/pKGtA6fS7KVyNjOmXf
	r
X-Received: by 2002:a05:6000:4616:b0:4a8:cf12:6f34 with SMTP id ffacd0b85a97d-4abaab6318fmr18378688f8f.4.1795358166624;
        Sun, 22 Nov 2026 06:36:06 -0800 (PST)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm18945409f8f.24.2026.11.22.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:36:04 -0800 (PST)
From: Mike Lothian <mike@fireburn.co.uk>
To: superm1@kernel.org
Cc: amd-gfx@lists.freedesktop.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org
Subject: Re: [PATCH 2/2] drm/amdgpu: handle broken dGPU hotplug GPE on ASUS ROG Strix G513QY
Date: Sun, 22 Nov 2026 14:35:57 +0000
Message-ID: <20261122143557.2412982-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <8072db9e-0df4-4fc5-b86a-cc50ac7934a9@kernel.org>
References: <8072db9e-0df4-4fc5-b86a-cc50ac7934a9@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Mario,

Thanks for the CPM _L05 quirk. I've tested it on the G513QY (BIOS G513QY.335) with the dGPU runtime-resume patch on top. The boot log shows `CPM: \_GPE._L05 notifies missing \_SB.PCI0.GPP0.VGA, using \_SB.PCI0.GPP0.SWUS.SWDS.VGA instead`, and the external displays come up after a dock attach with the dGPU in D3cold

Feel free to add my Tested-by

Mike
