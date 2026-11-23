Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417276;
	b=pDGFgtMqJf5WkbJhkVBm9Q5t/GfTJsUe76WfJ/3ge05apSwscWjh9Hc/xXHABIlvVd2S
	 wiv+jg6k51K12b63BJxFITji+b1QQskXUArULX3fKqLAOadlnV1M7g3OMaLJPDVeiJI78
	 KEiu1wkquwLGxbI73cdQOvK8fywCwx/k6e14FxWH2Ya3O6m+9A57PjXyF80iIw6fgeqKv
	 Yh2dlovwxqoIXeY45plyIGaSDxISmO/GN9dsdaOA5A76DU2NaKFgxPI+dOjrNqw2us08a
	 +QNN2isv7pOCbkBDAzEdV5JWTO4M3PrClH9zzIBEGW5Dbt0bWxhC06cTwEEcKbwFxYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wOsuRVgpL9gZBTN3yhy3WmQv6nl7mKO4w5iI9O9n2S8=;
	b=XVAn9JW0NAd9brrN3jUqFVQWcYRg3a1GiezDMeKXisX4QYxhZuZf3ULinNL4YMH0bD67
	 8Mdi57sInLe2qsZV9/J3+QNacvkY/CXbw821WLDbpk+ayghKr1lm1i0so46di9N7VfMOp
	 Stl2hKJ97F55hYAQMlcbZKE5ULYYDAc8EMJ2c1b+1CDB5DUxBYpnvNqHUBDvBCQPLcJnZ
	 rpC+sw0m5u9ZX0OzpIAnDowX7ZEfCMdLpDPwpdfAODs65Qtpw8tsYcGY7E2XbcA/SW6HK
	 jjg2KQNOzy2hGnYuFc4bUhYTJzoDU1iCRrU4ZW8VgH96CtaMZBLcipGkN1uZuKhPnug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RphP6QPa;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B67606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B67606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RphP6QPa
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b5786e099cso205254c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417275; x=1796022075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOsuRVgpL9gZBTN3yhy3WmQv6nl7mKO4w5iI9O9n2S8=;
        b=RphP6QPaPtA0raybonBWMXDqrJQc7DtgmWQXv/+2D14H0VkMcsmEiUy7JjA2UDr97J
         b/FLvGpFg3oypeEjsFTumWnuYa8IOZ8VI23cAOCMd99urJkb0SAkYmIxzt+DHdtK4jjs
         Ima0anPotykxxv+Y7tF7Lkblz6PHe7oHnMo1JwZ10AZn530XRrz8IuvW2WjhkNH6VQkc
         k0rSEEoNQsckYzqAiAz8ljZhPRVs28eD0CKLwz2eBlqhqccKQ+cQwNg/kOrNguocBQue
         H5VqtU/dEmu5XweP7HK0AOPnzNMK5jT5uNcaqf3tmDq17WYB72QfEWhGtNJsWBFItLAl
         J+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417275; x=1796022075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOsuRVgpL9gZBTN3yhy3WmQv6nl7mKO4w5iI9O9n2S8=;
        b=KC8lv6trtaUP0BGZ5D2gBX3DJzzB+MOvn97nSoVPTvWS6tZtwUNrhZcX1PL0TMU9Gu
         Mu/lZhMIB1nZBroLD9KmNJTwweosGlePbzKjgp9Ogqf85XhuREbmpQMIPNfl67Q3kc3A
         zHJrFuNztiO5npQeZEgUJq0EIg3M9q4HWyxafUtKIOzP3wzSdY+JjbJ32bm9oZ9pVfiv
         2XbTb1fA32lW6xP4+TKlxYepVugRTORm0HWqSPjW+jl9/PRBfcXtfSF61AkENsGln215
         seBVHqMJXoDAu6/V2ZmuDJzRznYAom6dUHxTOR25tarjbvPzCqNjUgU5DN8H1g2ghavN
         gCeg==
X-Forwarded-Encrypted: i=1; AL+hErGH6xwrnEmVHEx2ZMdcuIu9DkxJ/2dytxwTGVMriRIav2zP6rtB2lD7GUHqcSH8MWAuw52S2EXtoAHc9Lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z91ybrADhsvTuu8wzW83QuT8k108R8dHr9raPrL5+FRjljboYQ8
	yLI8aM9zrq3+qYIHQcHnFKYPt0nvUR1dGa/3XCfZ43IeK51KAjm6C1Q=
X-Gm-Gg: AZFdTZf111kUeqJJM5w9jva3WcdlBoLzxu5rQXjzXfkNGok457M+6F5QPSx4GSfR4Tz
	QP06oBGojbOtUlSc+7p7CXyEyqHXqRHU9EQNapBvRj+Pmf5XdmdBBzdZN3uP8snx76cGFZ+DTKr
	Xq6MH7Z//EB41QzdY786XvnCUSeNO28u+4pQlZixJkpGYh7cDTQ3VRwHxZdODXAizlu/SYdm/57
	bh1Cj3sPtX3m8yUHZBGRrXV5CHE8SDwLyCQ8uwmVI63xxY22BrzEsbshkA250CKzgPTVWze1DK6
	RV4Dbek1gfXUQHyZMB+IiO1GBBMZYpALuRuNQftZCo1XvO/s/gl7iVWnGpa+U/E7+D3vOUUOScK
	GLpwBMMhZIfmUrCcBgWuxlnhci4d9o7+TozbNVYMqJKwCymH6YZifV6foalzVGyNB4RLUx/5ObB
	kfKLf0FnWEp2TLXXA2bWCmL76xqNe6vJ/daB2gpI0ymV3FqAREsSUrqtGuRjIlwfJsLPbuO04ZH
	ZdLB+qxx2KNFBIc89/9ufn/1zEpKWL4OBDtkV4n0T6evlVCjnhmkM3p4I6nDD+vFs8YQblXqWkm
	DWln0Q7+ugx4eIURHliToEs/NDrGSNheb/haOvD2lxa40Cg73ZwmCBSfAp2TAErfRxC7vb3OajP
	JpFvFx1SW
X-Received: by 2002:a05:701b:4583:10b0:1b5:5915:bb34 with SMTP id a92af1059eb24-1b55915bd9amr9227327c88.4.1795417275345;
        Sun, 22 Nov 2026 23:01:15 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm25283608c88.15.2026.11.22.23.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:15 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: atharvatiwarilinuxdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 02:01:09 -0500
Message-ID: <20261123070110.11736-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026112344-jaybird-glancing-b56a@gregkh>
References: <2026112344-jaybird-glancing-b56a@gregkh>
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

> Please slow down, there is no rush.  One patch per 24 hours max.

K, i did not know this, sorry.

> Again, why is this needed and not just calculated at the one place you
actually use it?

So i use it here:

static struct acpi_device *
usb_acpi_find_companion_for_port(struct usb_port *port_dev)
{
        struct acpi_device *adev;
        
        adev = usb_acpi_get_companion_for_port(port_dev);
        if (!adev)
                return NULL; 
        
        usb_acpi_get_connect_type(port_dev, adev->handle);
        
        /* Apple's location overrides the _PLD derived one */
        if (is_apple_location)
                usb_acpi_apple_get_location(port_dev, adev);

        return adev;
}

And its calculated it here:
static void usb_acpi_apple_detect_ssp(acpi_handle xhc1)
{       
        bool found = false;

        acpi_walk_namespace(ACPI_TYPE_DEVICE, xhc1, ACPI_UINT32_MAX,
                            usb_acpi_apple_ssp_cb, NULL, &found, NULL);
        is_apple_location = found;
}

so its used PER port, so if there are 7 HS and 6 SS ports

And you suggest that i calculated at the one place i use it, so
i would have to walk the acpi namespace 11 times in that scenario

instead i can just cache it in a global variable like is_apple_location
so i only have to walk the acpi namespace 1 time.
