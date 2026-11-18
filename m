Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992295;
	b=fOTdF3m51WhWg5vuijvc2ZTUGzPu6wew2FB+HRoBRhNrjp1IBH115TUwuScC6idbKozk
	 jeYR8oxFdXDdLJqroGE/uW5TwR+KTggbD8sI7vCQIdCoAkFt6OtJjrk71OtN5RVbyvNtr
	 pR3bGf3M5VR/CkaaRT648z5qMYSQnSPSN4Ri5AvYLh5eTf65ewSHVDehGnbFbdzdLouhU
	 95X1z3EKYJy65D1bnqEpsATtLsWpa0GtDNcJFVfGhfyCnuW2CcsUZ5toSIVJHo5ARpMbk
	 yRoNBP2QuA5bTVbOCVAuYbYMXObulnsptns62nJMcFSEweLFCX10I44VeCmGN+9dRng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+ZgSdL6UNb0hv3GzdEIBvzrpCjmu4Nyp3OJC5/hXrbc=;
	b=uhXTFGXy9MtpPLq196JTY8weeQilr5O74qOGCqXLsfhfq3MWPeh2R+S929+hJg5DoiHC
	 W4PbP6+dkzbIbedRnhOz31XybJKmt2RVgY9+RoSPaGvtfx9x6DfysYQlGJncY3l9O7pG3
	 Xq2VaziOSoUo1hmNk3Ncq57YNenyuJhdrZary5GHhhrBuWHTpjJMdDogfOHAkoZGdkRfx
	 aTs3PCreTpGkZOGfM6noa+2WtKwjtK9CoiZGAkr1hTGpb5K2J+DHu8hrO/weIstmMc1L0
	 cSOolymPpJzKMOqG5mp32B5R9XiIcuTkU7KtCfV24uYcMGQBoorDRHmaUPN1pqYXBzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtzuIwdx;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197F606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C197F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtzuIwdx
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so3654205e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992293; x=1795597093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZgSdL6UNb0hv3GzdEIBvzrpCjmu4Nyp3OJC5/hXrbc=;
        b=VtzuIwdx3lQTOLJH1YTykffk6pL+WtjmCUSCXhZ+eiI7p/D3zfIo4o8yJHsQ0+P2ZE
         imJ67pmsOQ8pPtnkPrsIAg0vLi7xujk/eJUzzD4Bsm+ghorSqW5Nk3coRO3DjbHL9JoI
         N4J4ZDqsX0IjE46DzpMO20V4WrViyVR9Oye8FnLVYyBcWxEuWl5JmvrganNLxqHYTrA4
         b3Lslh0v4yOBsVutCxXtm35tld66qxqKIaqI/uC/bEam0YS+YgbK4rDSO3u4rBm2dDcG
         qMl4dIKZ21NcztYVk1RtCUGQqRAXUJIQWTeshTXWDPrT33KHkNKpzB9kFVPr2CD0h80f
         jaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992293; x=1795597093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZgSdL6UNb0hv3GzdEIBvzrpCjmu4Nyp3OJC5/hXrbc=;
        b=kGcpJFhypqTTnzO38HBcrJYZHKOwzv7PJvaDzaJWJ7SsjH1jIuLHkVJULbgWw8ZfNN
         cxzuQKirax2Zp2Nn2IAz5Obl9Kqyl/CUVRe6DfJpfbmCJhFI3hkUZ4HCMR5wu3f0CjuF
         yTgJjGXGOPecLsS+jHvVZKg3iPuSMyo8OoAQmXazsfcixozryDcH9IVAFGOyfePdbN3V
         lLdAWOOhia4w7FqmhjRp+hbbbsMgI9GMBwfR6utxMcO5WtFmyE6wBbebbUvhNrAgbKDe
         8RUEwNtchac2iT68+TxTMkUSSsHPWp2bY2UgJqyjw4ZZPMMuNpvrJLUdEXwC4iiTVlBx
         i4gg==
X-Forwarded-Encrypted: i=1; AL+hErEApLbjAf8+e1dVKc1Twv2Vaa5wt5C5KTdcO/shNhDI3wvX4nh6GBf7IGFrFt3VE6LJMWt8Prcnapp0Pdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2twpxFfTVEyM+U0GJptbkejS6jjNE4LMCxYT5xoN/bzhtLV34
	undZ6gLGEsgeWfnmi9RpaMf2lla1ZZrX5InfT1tpIqQNMvJB21EXUTVRTJ/nQ3IrtvYJMTw1
X-Gm-Gg: AYBFou3+QX64/40h8ow7qZm9IE8TTSWGD7M9FLKOYczWQIfkcfP1DdL2/rrb1sca1/R
	pi7gbbHHYTapAm9XoVzwmd8NCZaWquL9NHRhEQkBDZ5NzTRZxD9b5gip8+xh4E/kciwHTHsesmu
	eMnRXEoJrqHv8Ty8Wdy66gdRsthE9Pn+Pzz5Val0zBRTn0GCpR0VitxzIshacBZyG5Qu1f2g+7H
	t0XPKn6LcKeX32pKn83eItUd+NVthEhb2+ZwqvcyfrEoNI43Ke3sA/IgN3oirw9Nr+9whB3qSXC
	sFweEbP3cOrAneKEDVQzeUwuBs3EjTZoFt55ks3KwWETAxo5FgaAa/f/3yFIX1FmK5VmOBBnI9j
	aOi47cfsazXusbpJnZu2Nx46T04f2y4G8nsDMJhjoRrTDIIcpNjtB29Qo/oHgwDs6bYYQdwz99a
	tY/lj5chcbkLEU6SejWVgoGeWi3MHJqyJd1qGM1EZKnzs3/tGA0GvM6Ce+dhNaYigZ1BksjZE41
	q7X/xIhdLGZZXGO11uAJ6DgfCyuSgRmL5YOWbk1pn2d0KPXWpIwMwXv0vldNxUwKLkHYivh/Mtf
	f7FN/NikkbpXBR7GSDVPRN4keMipEguOChjoOYsm0GYYhUAwQXoFDZCKp1ih028Zd7AqgGgHcE9
	YfAtxyrTRCL85FcGi+neLcP+CK1ANZNN4vhi2Q0E1O4k5UFytnQ9v+5qBzDTG5DJ4x3A=
X-Received: by 2002:a05:600c:c171:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb7da283b9mr33351565e9.19.1794992293167;
        Wed, 18 Nov 2026 00:58:13 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4e670dsm49455655e9.1.2026.11.18.00.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:58:12 -0800 (PST)
Date: Wed, 18 Nov 2026 11:58:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: DelaySystem@tubot.lat
Cc: shyamsunderreddypadira@gmail.com, marusik.adamenko@gmail.com,
	rajveer.chaudhari.linux@gmail.com,
	parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: most: dim2: use atomic_t for channel state
 counters
Message-ID: <av1ooLApGizPA0tC@stanley.mountain>
References: <20261117-staging-dim2-atomic-v2-1-a550f0518043@tubot.lat>
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
Content-Disposition: inline
In-Reply-To: <20261117-staging-dim2-atomic-v2-1-a550f0518043@tubot.lat>

On Tue, Nov 17, 2026 at 04:06:06PM -0800, Maximo Manriquez Lizarraga via B4 Relay wrote:
> @@ -682,8 +682,9 @@ static u8 channel_service(struct dim_channel *ch)
>  {
>  	struct int_ch_state *const state = &ch->state;
>  
> -	if (state->service_counter != state->request_counter) {
> -		state->service_counter++;
> +	if (atomic_read(&state->service_counter) !=
> +	    atomic_read(&state->request_counter)) {
> +		atomic_inc(&state->service_counter);


This isn't the right way to do it, because it's no longer atomic if
you do it as two steps.

regards,
dan carpenter



