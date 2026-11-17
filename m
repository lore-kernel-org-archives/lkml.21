Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942638;
	b=KM66f6k9AOu7fKka9joh3bmWJOBBOqKVCd4gVCwhC9lTKDyYXYHJCBwczD8Z3SM7rtWy
	 lI50FtclUkytW27ch+5YKc3N5UgEQe7PKM3SUacRf4m1F9m52Yp/HWHQ0xdl+oPxwZqN9
	 jnAmitaIfJbvdmDsLam0r0U9j1HnU4hp/QMEhkSqGwNGr6ZiiFC5hl80lp2p3yQpY4DY4
	 c50JAWjS8McahJsGif4qy6tqpv/+DPSuB0KLa25F2Xn3vwa3+uCDCQs0oDX7GM28ZB7y+
	 vee70oJWEgxaMvCGmPEaBki5EZkViVyVSIj9zjj31xkAD1Ig+WYQ4lHIpe0OD9vK2Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2xUd7HOwARMUF3AW3gwuiPFH+PCIijhUinHxFgOMy1Y=;
	b=KdOvuClQdjxDzvmLSWhzx/amA6e0b+6cOPVHlAo0t9iqFRkqbNtfg22Eb7jpf7YcBpyD
	 Vb2gCcEN1TlfclNpwv0kN9n44WnLyXnM6u3Lox1i7gulAaXd4xJuGLHn3KUsuSLhCsQDl
	 hVfpekN6pMbVC0tu7rq1AHKpG8zQvEF8OAYFUH4aVF1q5dsnoqBnM7CKUm+1xAwA+AMLr
	 F4klXADTz5x5QJyJ5gwSWpbFSwBsLNscCc8HFH+zuYXrl7St7VImpD6hudQRGUITDYWqn
	 vpOSA3si7OkkbS4mLtajpLu3VO1F8OLLrrKl7aWkArELC8tZcLRBr7B6mDJ3cZKJGUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xx+fpoRn;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693E1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xx+fpoRn
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-381d542bc29so428622eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942637; x=1795547437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2xUd7HOwARMUF3AW3gwuiPFH+PCIijhUinHxFgOMy1Y=;
        b=Xx+fpoRnpCRdOqze3+No/nxk+FWb0wxwuM6eu/X23MEs+aFeROoMZIO9Wy0FB1MWud
         l/SHnHAnF64alqRTwLzL6wfT5yKfPlRPAYl/6X45Xqhf072qRA2390XHDJQssuO1Zsmd
         GFXTGlvCWIQ3ytqOl/7D2fI2Y8g5/ma+qSi7tC8uMPfSItB62y8QaWAKdeA6iiSRNK3r
         OSBf/tr6CFiBmM8I1S3gFiaA7z3ZYSA3cGbaZtk7O+/Do9//5V1WSnUza2rvP8DzaaE8
         +G/3A1n4BAvH32ov25k2YLclpZ5yN59WfcrlZFAg9BFUuNfU8tTzejq4TQWi3ChwCQXd
         80Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942637; x=1795547437;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xUd7HOwARMUF3AW3gwuiPFH+PCIijhUinHxFgOMy1Y=;
        b=S7Th5N90inPgYIZL2fPM6xfGu4SwZQ7aYt638W1RXcfJCqEfdWHOT4WwU5GAUnwSGY
         SAunghu9NuGvihGRjL6oZollUZDE3VNuC9MAksnHZi4tKMfF8XqWJAD5joLsHwTGhdcn
         uLA4lfEnlaTQlAPJkpm4PFGkDnW9p9KXRA9aWiM6Vvy6Hd/c0btdoOwqXWnUX6MjbJ7q
         DtNRLFV61Gb88Qn1v2lMrcZBb2FB4dDAqULnh6xIhocI4Hj7f9NABpSWHaJWMrIsR+ll
         o0RD79jtMlh0eu1YN7xckc+LdlT6P6U7zAtK7WF6yP/ej6YQgtGL4LeChchCM9dyMG7a
         ZA8A==
X-Forwarded-Encrypted: i=1; AL+hErHfEm1yqCBW8l1jrzuZLKwjOypporJnnFLdmLsyQeAu4VCeQ4PiDyZp+uKXQBTQhyD4I+weqWYcxWRLD+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iKxUH5JbAKda/ZUEx0XJzwlpiT8l0XVfqRJwcpH+/BwO6WMfP
	1588H/jS0OGLHBSH2RlakOkZGiYgz4h47iTb5UxFZTZzJa5NTSoxFyDR
X-Gm-Gg: AZFdTZcTUTbsJJ0G47SNWUg2L+cvuZzIQkfAL7JTjQSeLtb1JAFPqEIHCLV7wLqsyVy
	+U0NBbk2ZbFi2P3pIxE8+qjQNPvxlFTjip3yMbzqlMgaJNdvZ5Y1PvqB6SWniZELfLpaLUxlis1
	j8wmw37X7A8XUFxlIzpohx3bZe/SJu0wEwY1mYWMrngox+vTnS1yuqvhovvzUc1fqTcZC7RqvbN
	RWfB0TVQrYtjQzgto3QrWTntCu7tMfUamygIenalhMq0rsGO98/hhPXzCkg7TgTYdtmfNeGt8i9
	3NA1/t9fOQDBRnHAoWdTYWZvSpPnwZkSyAEeh7VRpQJxvknoxvGkT+X8wAeCwWlecvtlsAQg7CY
	Xr0dhvlSddAilMUxFNBLaJWAU1wHcpPOsG2FPGxKmpfoDgyIN3eJy5LvMuI/5Am/N6hijaGvQTb
	xE/eh6ha5gdDd9+OGOxwqAVnybAI6EDG0k1FheB56ylCdgrijnGtIWVxjQHaiwp9bZ8YxvxNp5x
	+8zMD3KfEz/mz7iO3Zvvb3hFrKmM+GGZPZLx2GffIgoRJwEmfqW3E5FXZ5FTpYIpMCOuG2m2Ndy
	BxxQlIVZOAdtL3Vm9rFxh5HFPQnvk14VkCiGz8cdGB+4wg2CeKndb7tS2+sULHx+GQWmnRTxn46
	bLkrnQxSzTuQ0uHuTnyfoQMkvLdPmMyfiiH/8AbRJhl/W2Xgywa/6TP5fAEe2K1Yj7vxCcMy4Tz
	4XlWSS6/wo3AhhNtNnpJIq48pDidDuLESwNWxsvaDPTQ==
X-Received: by 2002:a05:7301:fc13:b0:36f:29bf:4326 with SMTP id 5a478bee46e88-3827abdd3e0mr382876eec.0.1794942637141;
        Tue, 17 Nov 2026 11:10:37 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a172a0a8sm67255eec.0.2026.11.17.11.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:10:36 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] iio: proximity: sx9324: fix proximity threshold writes
Date: Wed, 18 Nov 2026 00:40:29 +0530
Message-ID: <20261117191029.83901-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avyj-lOGvj04A_Ak@ashevche-desk.local>
References: <20261116205320.26070-1-kapoorarnav43@gmail.com> <20261116205320.26070-3-kapoorarnav43@gmail.com> <avyj-lOGvj04A_Ak@ashevche-desk.local>
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

On Tue, Nov 17, 2026 at 08:59:06PM +0200, Andy Shevchenko wrote:
> > For odd r the read value is (r * r - 1) / 2,
>
> No, it's r²/2 but in integer arithmetics. That's why for odd number squares
> it gives 1/2 that becomes 0.

Same value, but your wording is clearer. I'll say in v2 that r * r / 2
rounds down for odd r.

> Yep, what we see is off-by-one for full squares. This is because division
> by 2 in integer arithmetics makes it floor number. So, what you want
> to have is a correction for all odd numbers.

> And here I would rather use (val % 2) instead of 1. See above why.

I don't think val % 2 works, because the correction depends on whether
the register code r is odd, not whether val is. Odd codes read back as
even values too, as in your table:

	reg	read value	int_sqrt(2 * val + val % 2)	int_sqrt(2 * val + 1)
	3	4		int_sqrt(8)  = 2		int_sqrt(9)  = 3
	5	12		int_sqrt(24) = 4		int_sqrt(25) = 5
	7	24		int_sqrt(48) = 6		int_sqrt(49) = 7

With + 1: an odd r reads back as (r * r - 1) / 2, so 2 * val + 1 is
exactly r * r. An even r reads back as r * r / 2, so 2 * val + 1 is
r * r + 1, and int_sqrt() still gives r. Checking all 256 codes, + 1
round-trips every one of them, while val % 2 still fails on the same
127 codes as the current int_sqrt(2 * val). For values in between,
+ 1 also picks the largest code whose threshold does not exceed the
requested value.

> For the write part (the negative is problematic only on 32-bit case IIUC)

I think it is on 64-bit too: val is an unsigned int, so 2 * val wraps
at 32 bits before int_sqrt() sees it, whatever the size of long.

> > 	reg = SX9324_REG_PROX_CTRL6 + chan->channel / 2;
>
> This one is not used in the conditionals, so the new check may well be done
> before it.

> > +	if (_val < 0)
>
> Checking _val after assigning val to it is confusing.

> > 	if (val >= 1)
>
> First of all, I would drop the '=' here.

Agreed on all three. In v2 the check on _val will come first, before
val and reg are assigned, and the condition will be val > 1. I'll make
the same changes in 5/6, which has the same code for sx9360.

Thanks,
Arnav
