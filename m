Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756460;
	b=2OKX9+9SvgbvO0ShgZ8Zwd6hIC3oRbP3XmZIFKCEXfMbn+w+q9Tk4cWpqfbtoV0BX481
	 6VLl7UB+2OP2zGQbRohWLcsvtxRoCMoZdB2pzXrCwevPtpFti6c/aT5d6VPtDmrKwNQ+l
	 9EWy9J5lzo1XxrPXTQTmPYto6asKGBnaD9h5tbYJl7JdzRIw3fPIBu6HjXj5O2QKBmfym
	 Q0LjCDWLyRAR/W2ulnbDlrNCirrnHIDUxky4vKmjbkL3W8g3sj8MEtmDNtE4kfREn+eQa
	 OUAreBEX3medzBqLuYdhJaRlOD8nvl3NsabgLIcSdkp0cAqc1E9X22d6ciq+tEWOtNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BPk/BlkpSjsU6PhXk5sbl5froZzbUVsLM1nv2qWUBJk=;
	b=P3gHZiIOdfA7wyrQOr4MlI3paDtoIo0cFQWpalI7inNpP1/Q0Ia+dn4gALuY4NmR7TnW
	 UcGRqc03qUyl6R1P4WEBMN21eAY1GsHHBr7p2EnJqTZEv5NilSNeAIiDdEiafWzLwSkzh
	 AtEUHIJfK72h+e8WLkf/eFzREgtNILhT65hSxs2OXqE2NHL7Z78PaouF3673KO9n3j4wp
	 /+UqYEGDFQBn1/cZ0685GF+BD+a6q0oZzZxo4pVaGqcXzJoIXSa2j5J4ctdFfuswR3HoR
	 Hdl3mjFwCR5BFY4iM7IIVY3STD5UNKhn6lm6u8UboqfkRb+3PDt3WhC9ihWCzfSwwLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwyFnGZg;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A729606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A729606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwyFnGZg
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so73802355e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795756459; x=1796361259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPk/BlkpSjsU6PhXk5sbl5froZzbUVsLM1nv2qWUBJk=;
        b=GwyFnGZgh+G3wJbuIosavkTPnUJEAPDb/zZq+cmHIEhebOtGDgeifD8YXQBjOCJiFW
         gfSbZHRHrmmg/mvGSB4DGbEhlQ51IQtdPtTtXS4RKnCH0EEX80JU3UczuMUlKRffm0Wy
         yroaQzQiuQj5MyZuJDlK1D2lKVlFxoMvwg8cJIa3txkAV91lf5K1W2P8S6s7xCQhAVQ3
         22LONAsiNsxlCL7+JPjLAm7OxB1/inPS6anh1FXNE2kzW9NOIVfwnAihvz1GuDhvRLhN
         +aeJzvQAE5E+FGwmsreFK+q5gBRB+fi62ZUgb6WfnqCd0h7eC0S7s4nAKlqdlvB7Bx7H
         U2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756459; x=1796361259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPk/BlkpSjsU6PhXk5sbl5froZzbUVsLM1nv2qWUBJk=;
        b=1vrY+vzoxieNe5uyXoiDudx/fHuiP1ncUG3l6Qnr4mLa9ulcEaPRT1p8OB0OyczZkA
         mPxuBLFAo8wW9bRSH16EsE9eVwDZXmr7Qai7LrZ9Sf4YBxYo+p+T9S/mA4WVCg1M8OCu
         jAYBV/h+IIn5plIbyqZ9WQ2p6u6+Pe3cFYhpO8IzUcocDdo2WC+TIt/IPEBIuYg+0qup
         OaAXdlBTVEYOmeo0NCoZsNc/50/YplOuBylawjCnaZjqL2eGWk+78ZBp+BK0zWyPU8t1
         Q9JPiInHbJZacaK8p9KH9/yCtUk7mQ8qINiGOAHBOJcdpfDXRI9d1mPypQnSXbmAKPcR
         L5yg==
X-Forwarded-Encrypted: i=1; AL+hErEAAjnOIN9pwHyPuR+og9F84BZ+UA6QFvVBeoSqh7Htqu6eYm6GijdquTOBUgqkQeoBw4xo6HRSfwUFPwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u1NT9IhBlhrJd/ZcUppSyxyzJgSBBgRs6di47n2ycnW8IyL1q
	TxL2Cgwo+4IZtgdFJCWlDpxNL7kFkXA8qimerRdg2F+6D/d8fDE8beWQ
X-Gm-Gg: AZFdTZdiN3bMqYqHiTdqYkguQy4uSA4vDcHJq5xJGTewzCHZm8gU4iv62ZQUCisdHPa
	F9tEvPljM7dP4ERXmuCELhx1tCj5dmDMR5L3P5IQ1oDJfo/mWSI3DNSXjTQmy9hVkA7svjNEnWj
	ipXqR7Vf3MnSvU+VFxQ1eLVwogvcD9XqCWi0OysV8QCJjRo4cbdROtr74hBLNeLYz8n7gz6v5uc
	OOGbPvQPMOSTF7V5+lxAAq644ZpzJtp7UgXweqziKnd+snikQIt5HOPcJiSxt4r45R/jm5ORCXI
	DX/NMqNLZXIv9b7r5Ssf0zgnwRIXrT12OLbdx8YZHbFLUetaaXBi4OQPs+nYcOXNjB1rrLUCcaL
	sMoDRaMdtznbdj3ehKmIJa7LcEupsOoujsMr0AbSH/UmQCTug1KTVQHflgrnBqOUGG2IhQ6EO/M
	DeCRqLvlrJkjR/kZkwKjxin/c53EkuTxGoTccwDjf+s4yLNU0W0SzQBw4gX/SXzYNfx7dq0UdP/
	B2eXTQUE2MHBnIre/CX+7v/qUJG4tP01gHI5IbfO6cwVzKlO7RC3rhRO4FRLteXN9cF0wWeISV4
	CzMYuD0w9w2WadSOqNiLiBL2sZoORyp4soyUeAdVK75yypYwS4KNK+IZEXeaAsxmLarwWKIrk70
	wpbY+QqqTvsSZbpVj+JV8eQ3j+E8ix7hSrGsRAxF4zJNmtMbyunbhaVn5doRC5h9fmp1qzg4Ot4
	NpWcVxkHT1Z7a83pnlqMo/EKU6bXrxXaAGiH7lLAHnZe1J2rvnlK2YtSBLT4ytRul+ikU2AtSY/
	qePXnXvgPjo
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr454605605e9.20.1795756458767;
        Thu, 26 Nov 2026 21:14:18 -0800 (PST)
Received: from sergio-82n7.homenet.telecomitalia.it ([95.236.10.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm641372085e9.8.2026.11.26.21.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:14:18 -0800 (PST)
From: Sergio Melas <sergiomelas@gmail.com>
To: KuwaLee <kuwaleecross@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for Lenovo Yoga 9 2-in-1 14ILL10
Date: Fri, 27 Nov 2026 06:14:16 +0100
Message-ID: <20261127051416.479623-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120230744.34942-1-kuwaleecross@gmail.com>
References: <20261120230744.34942-1-kuwaleecross@gmail.com>
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

Hi KuwaLee, Guenter,

Apologies for the late reply -- I had to step away for about three months
due to a family illness, and I am now back and catching up on yogafan.

I verified the ACPI DSDT for the Lenovo Yoga 9 2-in-1 14ILL10 (83LC) and
this patch looks good to me.

Acked-by: Sergio Melas <sergiomelas@gmail.com>

Thanks,
Sergio
