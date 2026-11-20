Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186898;
	b=v+T3+jvMrWkr9LGwiCY9jkjwb2kR9r9L82ZfpK3riNMTABog7BFEIqiSqvlijvU8rCRc
	 wPlJvi/5N0gLwSSyOcT/fELi9Vz8Zcum7hLZmXqk9BmI+DOXeDpmpLcLgE7ZOIn6sILDq
	 gEGuGj4V4xrGI59n4Q5XrUXl7zpmVBkB0CWtrpzqStg29+FB8w5jQHGEuHVqUGvjDblVH
	 yP10inALSRfIlWCk46MXex3nTDkIKZA1hoyg7IlJvzy1nv1F4x8uszMODBGcaJqFIMbaz
	 fIUtmo5PPwAlIgLJj1i//3uPTzc6oOTEdLlnI1aMq/Am9V/DoWOrTqkhuNiuLEW/vVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=a1raqnnGut4xynOxiwY0p1mw/MtwsmNrEMEfjzI9bPk=;
	b=uIf3bS30LgYRRMaKw+eB+tnlOjgg+hbn0doL5wvnDnXU6QvCgUEzImLYRT5WoLy7ij0E
	 vhklSohA0rCxRxnPfi7QeYG2IRY7N1b+7OjLKrrh8gQNUvrIn4202InIkLjiw+u8uRVj9
	 V5D9U7JrgIeiRqpB4JXcPFOegyJElJypetKGk4ncEMUMJEfnzoEEAtDQnpgBHTdpXX50a
	 QVoFnfQyy0Mt0nC3rYuHViGDncm2aULUw6sw9sUT9pOxxlDcIn+0XLu5l4QXKwZyLUoVh
	 h2Rw33RhNp1JXBP1SaMWiwzDv+gvmJTC2Eu90B4w3qBqPjfx4m5FBbWM85ePrSxEtOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nw2iieT6;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F78606A80A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F78606A80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nw2iieT6
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso542255a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186897; x=1795791697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a1raqnnGut4xynOxiwY0p1mw/MtwsmNrEMEfjzI9bPk=;
        b=nw2iieT6zUVADY0ray39fHYzAT9kH2gz9FKtZKveuHZrNp9Gj7Da92sUF7KBEb3qm1
         8cFoW2kOr+coqqXW19d9xm3X+DegN6RdC4dyEATwvfqCXR36HgV5VAeodwl1p5P/2zcJ
         x5vtmdT3YkWZ2DxgeGRkn0GkUb9SYzXzOsvaexaXMR+qKvwcV4ELzk8wqReb/sKbhHBa
         ev9iDIAJHPyIQlURYXO+6r+HWBM2MsVMz+MZ2qAkJxFf9MQ7AxJbM1pjww8j8GeAjKFr
         0rHreAY/UKOpEmnCiRWOxOQ8bVTkbpGeGWjAOov0oc5RNKC4cR7AwQjhq4/6720izgd9
         jO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186897; x=1795791697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1raqnnGut4xynOxiwY0p1mw/MtwsmNrEMEfjzI9bPk=;
        b=xmdZv7cQKjI23koOo+WtEPbBGyVkpwytbOGoTjSVZ4qDz5PSkRHRBMcPxLdGpg6TSn
         rkQe9F+OccemHyWKtAGEKoKPSrzz/SXKjzHmrCKZCDT9lrDem7Rk16E+KFaTP02f2Ttn
         Xvy093QbiB7ZBv9bwEOwiXw8mOUUQUu/IB+robaNx1LeiQOWl3psKPx83tzXJIiKX69h
         LanbtXTjDyGK4ZksR1ZNdd69R6BEacqTf6uZ/f9shy2Ccok9EDtETMdr7E/36V+ERt8v
         x0/5Yne6woiqGlIajKRZ8cQ6/8neVl96+JrMN55O7IfziEcgqAJAUVFn3hicbwvxr/So
         o9VA==
X-Forwarded-Encrypted: i=1; AL+hErHXxChXFBZx3m83ts7EqH/PDW3e0WF37O8wOHaz/4JuBXsYILndiweqhvoIHQ8LNaColzNNADWYeLlgM2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/+DQnYJ4NqjhEVuVKK995fCjZoGPogyV5pbWv3MXBsJcLVUSb
	TGkIMBNeR91XQLhG1eUqqIeUqvN78BCBUuH/i5FhrRjbREWYk1iubzDTvOsuLy0Zqps=
X-Gm-Gg: AZFdTZdqVFghaO7A4AUTGguVVm4e/2HOX4qsNSQQbTOgYhy8QcnunLn2TYgxYrO7qgD
	u9sDVbitAt2IoEQZeCP9LdoCz3WCjHpbuarVYr0WOKqNK6FNPkvYatwVWFv0rC3w/MLQOUbMjgk
	PdUcFdblMNzu9iihA+m77d4X+LybZZ2ac+0biiza0U6owEuiY0OUhRv9TAa+BITemzWhhlaTGxq
	m8NEQ6ZVmCB1ZtsIbZ523e3FLsX1/TYNAsc7kZfXkQkgxcqd+Hg+6Y4Vc50G6JATQjdc6JZ+PQG
	Kwr3QIhWo5NBnR1DwpyF8kQwM6GtYgbS1fHwuv5f49wphn9rW/PpwzeLTJa0uRaHYpIhRuFi8Nm
	7gw6QrVvdlerWAbrGFHemablyLeBD0GKniW4rN5upFsPXqcGS8SgMuHdccx9J+PKf5WjVgUogjl
	LItt61BwBAkgycXZNKsHy/xBzpL1qMYiKcF9edDX9rUUCtuAfNK2i7MMjUj0Kdhvm3AEa0hcv2x
	kC6+KnxdcPdp87EW3ECR0+UTcgAn0VUL5jVw4wG3V1X/PRL125KQ2JrmW6MeaqyK8P39xbs0+4X
	xPUAKjG/iu/KyExJElhcc5N8lbeIW1Tp7WPX7GN8Wcgq2B8Clt43EmWKZkmWqfV6tZGbX4I4tJg
	W5Gi+Tja+7W0ZxConGSzugWXQqVM3HOHW3XTr
X-Received: by 2002:a17:90b:4ec5:b0:3b3:a6b0:8991 with SMTP id 98e67ed59e1d1-3b41c96180amr3266903a91.60.1795186897160;
        Fri, 20 Nov 2026 07:01:37 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm7652978a91.16.2026.11.20.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:36 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Sat, 21 Nov 2026 00:01:32 +0900
Message-ID: <20261120150132.3128382-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
References: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
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

On Tue, Oct 13, 2026 at 12:44:22AM +0900, Yehyeong Lee wrote:
> usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
> the OUT request completes successfully, looking only at req->status and
> never at req->actual.  A host that declares an 8192-byte WRITE but ends the
> data-out after 4096 bytes still reaches target_execute_cmd() with the full
> length.

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
