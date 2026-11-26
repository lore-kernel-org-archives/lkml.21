Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676448;
	b=ssiSTlcQW3Fe621Ij89D0OJEfbJ5KfQHnMBWsWdWEDH81UgItwe4ZlR6QjE2VNho7d1q
	 R2yElnnzWlyg2destKGOUK1nmuxtDdBBwurxKZ3tPjm2IjNKzND736Ts2Nnu3EawDnJ7B
	 VfaikYvPNXjOoZtGgAhkIP7w81WDRlrA4Ogz975viYxfjivgqPI2493XPkeol7wiDSeOB
	 ic+dflcDKLeGUKsvaRRhFXjS7uRBWtkUJtX5JxrRbteIJGAdWjRjH+ZOTdmFvIgIewYzD
	 cKJtg7eclOXLazEEliGBXV0Dm++BoL6VtC+m1Vz7QPUidq6qSu6JAlo+ptLF9xS5lqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=mStOOu/axIi7drAvoWRJ7r3Hx/Gyqssm2lxGWxjMuxo=;
	b=ncq/e0zYVIuJ0hBcVsE0FN9Lq+H3mY9ZTSPUDZk5UhjgyOR34iQkaMuK7+M2bhIvzqC8
	 cuoaLorEFnL/n0Ul0Dk62Hg+OERkwQspRptdUOoKlCnij3GdxIE4PTVr+1Yg+UnLzamNF
	 2LthK/XrrbczLj9mtdG3ToZ3HsTYDzeQBC6YIsxFT3kFcfGGryrZpE6GqV0sD+eel/XL3
	 OoNgOjzyPrODthp5pbjdHte6CsYP6o+SGOLTw9WpUnqi9W1pNTIB9WGMKWqhUDlN+UwV/
	 4dfIJ63Ui2GD5/XVrmfE5wvjJjv45ulrx7CRgjYMKgAtMxuu5667LNLxEVRNtcTFXYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7hhHVV4;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04745606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04745606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7hhHVV4
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386b8f2f671so3605575eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676447; x=1796281247; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mStOOu/axIi7drAvoWRJ7r3Hx/Gyqssm2lxGWxjMuxo=;
        b=a7hhHVV4XOanpdnYhgaaWWjn3hQY2vIiCBe95lBhBpeE6+kD8kXxQL80yRTYBZuk8C
         S4GofioqWONYGV0yc4q3dokog1dyRPKHQ1srnEfUELPk3cBB7qALwKuE+pdT1UyNnyiA
         gm3sW/HZnwSOJVOzT9iMoJXxdkXcOJvsv6g9XO72BlEqnDdXT8pcE50wMyHoBNxsWeK+
         Zleg+TgfAkMjobN396QTacxqptPj0qLTGcbE/yfqtEj3I5nHR8qj47CPOVSPqw3+9zHt
         ZKrdIUnECCJ7fuJkAeDLLySC0dUkCW05MA6ry5TudaVmWUomAzG1uuoeAC7SvyPCo/Iw
         dH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676447; x=1796281247;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mStOOu/axIi7drAvoWRJ7r3Hx/Gyqssm2lxGWxjMuxo=;
        b=qR9zhii8OMcUWmVvyJ1jGhx+OunWnnPEh37avuxATqbZpJWOPTUZdXPVCKCybfnYio
         CC8kXZqtNyll/ranWH1utYxXLcPSW1RJRhZeOS0WL/zSNfoTDYJlCEYx2XZPcTinjfWW
         uKfkxFmKWOYlfUk9OzFegE5AlBBnBaiIwVl5nArWX6GpCPNYhgNo5QxrN5prlTFiaqCc
         e5RiY/HqBXCSpgeJAkFjUigCt7tfFBUrd4GiaU34yGVjY1AiJJ8zAgUSQxiy+HLHLpPN
         Rmg8hlRDoji2u0RDGBPULJOgpZ4zXS8CTlxsEcua/JaROCdSHo2pnvwc5ATBmJm1mVPZ
         gleA==
X-Forwarded-Encrypted: i=1; AL+hErFvUrhd6laDy/f3cKGPVT/LgSEAUBb7sRhkjUieZCXeYcC/q5dgldlUmd84y9Qsc4Uj/NDzAda9tYYNfPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bp8DLlKnKJ3dkqo3WZNBMm4HOkQcmVwcM+TqvVgWggfEZWDqW
	NidrZ+jW7A3p73MWjDuijqbRPSCC8ajzWJ2Yxq8OvU/Hriv44KAQwhw4
X-Gm-Gg: AZFdTZd7+8jJ56Yd4eCRxF8u2HuHKBqWOsunQULwPIDCebpK9jzTyUKFKoNW2NCWr9z
	CnIzMqXx/VXI4FCVB+RMJ/qqXQ0Ui1iL6dJPALWsh3qs+oaQxjiKn0q7d2diwHM2Npwfa8EvOBH
	rwW4f5In3leRElVjDwApEBbPQFX9uiv/tzlV6cC/LT1opieom1KeY0bEI3+47tvo4giWSoRemko
	PSl+VjtecQFxe1qyNoSH5IRc63BZ4aAECr8Hj5hkGzt7szsTvfv5uHTNQZi1TKTrEvEMx8pxcUa
	ARwjk7oZQX0B/MiEyA+elsQl9PlZGCckcoKWF9bUv/lNsQJc+S05GOOS/c5K57Lh3wxwctNlfZ1
	29ApfIHajwTcnH8Y2jjMHkaJo8cwY74pTjAJcL/DPUMJRiOaeN1JJBCJKf9LRzycD3nxcN1w6j5
	6Bz0ufPZme0CwiWNEeLwvSaBUdMP/rtczfpZ4v8m8PQF5lY4smPKkXk8ZYWtmh4HiRrHG8PtAfG
	o4EFU4n3afScp0HYcuQMo56qTdkIZmI5lkj5Im9Qdk7FyTXk4ynUl1zsL+8nheFEyo1vErbgo+L
	1TyGddNBFZLaFC8czRjWEzBMrL1/GdWwYo0L0CVaQdOA1pU6v+3H0KnM+7ZCHAkCl7P0SLA3Mno
	xJESOXLyHUGFNBI4=
X-Received: by 2002:a05:693c:8953:20b0:386:a70b:75dc with SMTP id 5a478bee46e88-386a70b7837mr13493407eec.11.1795676446987;
        Wed, 25 Nov 2026 23:00:46 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm28281445eec.27.2026.11.25.23.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:00:46 -0800 (PST)
Date: Wed, 25 Nov 2026 23:00:45 -0800
Message-ID: <263aac71fd9eccb3cbf3674ccdab4c20@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] Input: rmi4 - Move sensor initialization into own function for F12
In-Reply-To: <24dccae7-71dc-4a7a-92f9-bd5e627f8063@ixit.cz>
References: <20260731-synaptics-rmi4-fnsplit-v1-1-8175cec2ded1@ixit.cz> <76e9ad4b-7430-41d3-9d31-9f513beedcb5@ixit.cz> <24dccae7-71dc-4a7a-92f9-bd5e627f8063@ixit.cz>
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

Hi David,

On Wed, Nov 25, 2026 at 05:54:05PM +0100, David Heidelberg wrote:
> Pretty please Dmitry. I'm not asking to get same usability level as with Android
> driver, but at least small amends like making maintenance of these quirks for me
> would be really appreciated.
>
> Saying no it's also answer which would be better than silence.

Sorry for the silence. You are right that a clear "no" is better than
nothing, so let me be direct: I am going to pass on this patch.

On its own, pulling that middle block out into rmi_f12_sensor_init()
does not really improve rmi_f12_probe(). It leaves platform data
handling above it, pulls f12->data_addr into it, and leaves sensor
tuning, data descriptor parsing, tracking buffer allocation, and
rmi_2d_sensor_configure_input() below it. The split really only exists
for the hardcoded-descriptor branch in your v9 quirk series.

More importantly, I am still not happy with how the quirks in v9 are
implemented, so I will not be able to accept that series even if it is
resubmitted. As I noted in v5, v8, and the DT binding discussion, I do
not want workarounds for non-compliant knockoffs running unconditionally
on standard RMI4 hardware. In v9, the PDT filtering, hardcoded F12
descriptors, and product ID fallback still apply to all RMI4 devices
instead of being gated behind an explicit reduced-protocol mode, and we
still have not agreed on how to isolate these devices cleanly, whether
through a separate non-fallback compatible or board matching with
of_machine_compatible_match() as Krzysztof suggested.

Several other issues from earlier reviews are also still present in v9.
In v3 I asked not to hardcode a function whitelist during PDT scanning
and to use a bitmap for duplicate tracking, yet v9 still has the
hardcoded switch (which is already missing F1A and F21) and uses a bool
array. The IRQ read alignment patch shifts data->irq_status and the
other unsigned long bitmaps by one byte, leaving them unaligned. And
the PDT fallback patch reads PDT registers inside rmi_driver_of_probe()
and keys off "syna,rmi4-s3706b", which we established describes the
compliant Synaptics controller rather than an aftermarket replacement.

Until we agree on how to deal with controllers implementing a reduced
RMI4 protocol cleanly without affecting standard RMI4 devices, I do not
want to land preparatory splits tied to the v9 quirk layout.

Thanks.

-- 
Dmitry
