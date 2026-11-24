Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495366;
	b=bf6EA+3oEYW3cSAg1nF+sYvLyH3K3aa3VbHNWTVd2Kyly+9B0WSYBuDSrZ8AqL6BzFMh
	 16Rv9VFEf6FvDtMm+RRYlc9zpW2CdRIM5f1A45vflGB19YndnkraZ6fwscV9DNxmqqFXb
	 kxe8R5u8ATnCrb2eekyCqxlAMm4WWhtlLs65YGYRVw7B+r73MK3cWYY795IwlZyGe/gkv
	 cN7hVsO73zwUd3eVPCfzYtNEM+yFNSfw4WkRf5ue8+T/Hr8gb9Cqb49sftVVxqJIWoeMc
	 uVW06vOoM1+EgOftRNTLNT/yUoI/fh5je1mL4lMDK94oJ4uJnBa8tZIHqwfzVyFmxxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=BVM0klEKAcwZ1Rgn358Q4l72nbxlX3JpSv5yqpJcU1A=;
	b=J0jSWOCPmoPNbaO1j1kATsph1ndm6aUj0Jwg8VZNAuT1C1neCzsXI4H6zJFh7IearaQC
	 clCo40kLL6/w/ltZ64QH8VJ4y+hNyPHyy9AQMtRjZGSUBdKC9pvIAijPHQPee5Uwr704n
	 LddLi+qo/wITo2468fsrCVkv41A4gUQ+gKfv7N8ueC1bXntyOiOfwt4eklIgxvmZ/Uq7x
	 SGa7H6BBboXjtMjUYgKweBZ7TCp0l+aGIM/5yuK6fVP5xpGOFyuXE5YyAQTxmSt7HrqEU
	 5KGTbBPbhkrrCyTweWe/gFHedza91jn3G2WR2iW5AyOgO7I4Y6yhl0vBhCtvjLfE22w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCOXoLb0;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 015F1606A6BA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015F1606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCOXoLb0
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so4716039c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495365; x=1796100165; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BVM0klEKAcwZ1Rgn358Q4l72nbxlX3JpSv5yqpJcU1A=;
        b=TCOXoLb0Fd7EWrHlEUDshBAKxbWOLCYu03wn9X4bfGaFTLPqwL3T/vcfsAFR2eoH0P
         003fq06ou+l1j2ZG542h3B4AiX93jegkRi58ac+u+KCkbKSma35HTDjhaRSuiBejPU5w
         x60nPAZtBvylYXuSm/Hy8DgZX+eyUnXxwc6lSJjdJ+hAEY2hFdhiLBLvqo2SYlFoaw/a
         W/lS36sDxZcSysPmSiM1sQgZ3fttMdUjBLxRUdnE4AaLfwiJPtE1i4qvVKT8kkcsQyov
         7h00fJPrnMykzACUNOg0dudPrpta+g/cKxkPmnCMwhy/W88gkX/n9rlYMGKLLeI9dpe9
         iZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495365; x=1796100165;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BVM0klEKAcwZ1Rgn358Q4l72nbxlX3JpSv5yqpJcU1A=;
        b=AjmuSAdadTH7BfU9kr6L2keGWrV2AMptQaHm7dGSo5pOLp+RtRjg2IjXzzNRtOvhOY
         2zhOpgplUfT3AVBr2FBZVp+4Rye51Z3ja0t3Sum5liW9TgswoA123HhBEfsfpmwx1qme
         d78S/0HHHCmvHNu2Noaobm0U4+fCGYu9ken5E4QwFNxTh3io4q0TXNUNhHf9wOJ1zP7C
         dotbiOFGtyBaYURpPcmi2u0wGaMQErSOc/9SAEcBn2GUAiagXwBtCkQgIoIvGIxyCAWY
         YIdac/3tP0vFvsz9mz/0zeuK5q0l8bWKTp+UyHaLg68AUyFuyrGwQpYXYod+h5m5AEpX
         24rQ==
X-Forwarded-Encrypted: i=1; AL+hErHE6wPEpY9pAiPwGaJt81NKklsVIx/1PToy2WNChzhf0lIc1zBdGOHMxCN+mZgOo9qduA8lLMWEG37heJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mkR2ss+e/p8maLX2w4n+9aOkls6iIVGJhW+FyJbru3yRGDi6e
	Hafg615EWNDHi1yOAG4XLQGnsmRyf8cGR+lhaE2Qv5ZyQNmQ+sctWwz3
X-Gm-Gg: AZFdTZfK/piP9hovgIscRjjbuGAQJs1Ual2HDYSrFF8PXULpu2giMr9x4uqQHl70X9S
	Nw6hjVXdkfvEmO4CGjF0Akqk0XxxDECJF8lNemuuT3PCY7Kp6+dTzp5SE3n+ARv5JkOtmgLjj3j
	f/JV7azGofvDzPLCjE6ids0p3xgXpjXm562h/sQn8ol8U6M8DwDsNX2lzAr+ft1hMyJE8YW40Lh
	Wvrpb0Qwecw40uGmgjuui57BeFpM4TwFa8S8hJx7XUuboDtLrYrjuVD6c6W9t8QpZRroHMAZiWy
	gvBejwXcXiNv0dFkOcuJ0S/IImV9JjnLX/c1ZT0EA+QfWnHVLq3rm5/TOscLk0CE6pDK8L6Mvpo
	td9tD93/ILb1+QzUNTdoqCYsqdBeKTpyuOz0LoI8GDNNFUE1uj8OPPqXU19S2VBVGaGvjcBh7zj
	73aGZMTdDRn+C85p3/Df3Zi4e280Z+fGP+0q0IZlabHmwuTtN2scC7iZRS8X/Dp0Fdl8VoKbHCM
	Aj+W4nH6DOruitVoGruONnTjXz9ZFobvlN81N95V/LlcQsVBmLVtbOBYLyy9SNhjrqLYktdxAGv
	N959zPlI07dSxXH9F0Rhp2VmvpNwGHG9sjS+48dvbiBru2XX3S1c3gVioccvKFXFXZlxfvmFib/
	Pk37aTA8g//7+lVXv
X-Received: by 2002:a05:7022:7f18:b0:1b3:9b4d:85f3 with SMTP id a92af1059eb24-1b5568a28a5mr16074647c88.19.1795495364940;
        Mon, 23 Nov 2026 20:42:44 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm45597778c88.14.2026.11.23.20.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:42:44 -0800 (PST)
Date: Mon, 23 Nov 2026 20:42:43 -0800
Message-ID: <4ab84021a5d175f5d3793e52fd818a21@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pooyan Azad <pooyan.azadparvar@gmail.com>
Cc: Uwe Kleine-König <u.kleine-koenig@baylibre.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Herlangga Maulani <w1zardsec@proton.me>,
	Rob Herring <robh@kernel.org>,
	Jeffrey Lin <jeffrey.lin@rad-ic.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Input: raydium_i2c_ts - validate report parameters
In-Reply-To: <26ac42dd18a98c4928cbe7f6b6adb4b396be4c8e.1790612085.git.pooyan.azadparvar@gmail.com>
References: <cover.1790612085.git.pooyan.azadparvar@gmail.com> <26ac42dd18a98c4928cbe7f6b6adb4b396be4c8e.1790612085.git.pooyan.azadparvar@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Pooyan,

On Mon, Sep 28, 2026 at 06:26:16PM +0200, Pooyan Azad wrote:
...
> +		if (data_info.pkg_size < RM_PACKET_CRC_SIZE) {
> +			dev_err(&client->dev,
> +				"invalid report sizes: packet=%u contact=%u\n",
> +				data_info.pkg_size, data_info.tp_info_size);
> +			return -EINVAL;
> +		}
> +
> +		report_size = data_info.pkg_size - RM_PACKET_CRC_SIZE;
> +		if (data_info.tp_info_size < RM_MIN_CONTACT_SIZE ||
> +		    data_info.tp_info_size > report_size ||
> +		    report_size / data_info.tp_info_size > RM_MAX_TOUCH_NUM) {
> +			dev_err(&client->dev,
> +				"invalid report sizes: packet=%u contact=%u\n",
> +				data_info.pkg_size, data_info.tp_info_size);
> +			return -EINVAL;
> +		}

I folded these two checks and duplicate error messages using
check_sub_overflow():

	if (check_sub_overflow(data_info.pkg_size, RM_PACKET_CRC_SIZE,
			       &report_size) ||
	    data_info.tp_info_size < RM_MIN_CONTACT_SIZE ||
	    data_info.tp_info_size > report_size ||
	    report_size / data_info.tp_info_size > RM_MAX_TOUCH_NUM) {
		dev_err(&client->dev,
			"invalid report sizes: packet=%u contact=%u\n",
			data_info.pkg_size, data_info.tp_info_size);
		return -EINVAL;
	}

Applied the updated patch to for-linus.

Thanks.

-- 
Dmitry
