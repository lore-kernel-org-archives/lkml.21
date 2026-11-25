Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640759;
	b=W0ixrGNkl7xqEr/gGsdDH9naVqjeDBVL6r/GgJ8zLHeJVhTKKclBL9cVcF7WPNaelAj7
	 cZ00sOk8Dl+xroBNUvBpMh9Iy2VmMtJvfrNkGzKCv1UiQV32PVclBuCX+CSCjHDBJqXs3
	 r2E54QWajqPsmIFfpS2Gy2EuiKDS/rJT0ETtrId8AZFUCg/QT4iOfcz4ELY+/jqty0m+Z
	 W1y49c5YYRoXuwobNlBVv4oZWwbhDegWlxSwYMv5KJYJOlD1X0d0PAX3bpyrquu2CYpq9
	 PODFm8xwK0cOKPKCbjEm/WWxy35nt87pv/KIMpiHQOmzLvX4W2HiQSVqUPW4HbYr4PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
	b=KUFxPpVCSfRfROtNXcpPn3FcSPfaWCk+oVodqMjOqkuqUWwCoPouBfAZDu9oGpP1McaN
	 CvJn+n9D89yfZYJnB4KFxrUydlfd02oyqoU50ByjqzBnferPx+Fc8ems9Jt3SvbrhSXcS
	 Blye9YDe3ks6o5fSjaBLSuQ6jx/Qio4sqNQ0bFlHX22oIrwrmEZCognQypzmtOD28sbRo
	 mb9lr8QiDhn3ZpwMytQZ7n4S8e/quTiR4EOwK8bk7PLdjLXL9DkHYpwovZ8GcZNinoqMX
	 eDlv4SiXz6tHmRDcZ6Puk/nGYzN1kDKsTJ2JfHAhVi5DcoNRW0lF93K1r5GOe6YBIQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PA1pgPBf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F80606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F80606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PA1pgPBf
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso7968499a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:05:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640758; cv=none;
        d=google.com; s=arc-20260327;
        b=WiWf+KKfjj8Win2ETdI6d+XUP93kjxCtbkGTVvVe3VbqyNsFfAfYeMlwhwdSEXmQxg
         qSdtan7KqaLrkKy7CvK7f/hSMapumGnqAxxsgp8WCM2i0o6D+XK1xKYrg6eh02a66dT5
         bQ/b309Gk5Brl3/gzj8+DdFJ6OcMvEa4CfHVSumkePR+AQRlBPyTs4VqsFhz5V9Oqtsi
         +dsmaohnxJqfF1aeBuWJjcmyaE8KNcZ2SZGbgOqqpLvfChkRppJyU/Ur4LivvhCXTO10
         cqEaMnxlOYzA/51y1lWHsV9SAk+lf5tnKDOZ7AFWcNEl6QaomOpkvNVSWFH/mBYdue/6
         UXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
        fh=QFzRRwC8g6LkclGy878qOOZMh5mkGJ7ugr0ALHc2L3A=;
        b=ggNTkDYZV2/l48OVqUXDZE3lHRVLP5ZahNeo5qds431/Az4BOmcVDs0iny+6U0Ka23
         5cw1JQ7rYy2HjLhOrzqEZiSN2eu0OuojNTEPezZZbmqxugb/Cj24GuuXTtiqhP+i/kJF
         lSMz/cXRUtO/0m8EHvFUl9FCAl4V3VhIEn4w/gdZrgABnJaIUIEZjzZ9Wu8f9JMh/VHB
         O+gIKfhCvDg3VoQ8WxcCxP+7iP2rRzY4SqYNFTO/dS2eibbDYq0unQcZ2pRdbl8ERn1T
         lUUMrkvn7dtuVoxRgAIS/1jSm3JjXhPvoc6bXPP663Pa8I9KdAcolJbtYe5aWl/hoNmj
         g4Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640758; x=1796245558; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
        b=PA1pgPBfLfbt9zwaq5zXPh6ZOA//AEDlj9969vrlEEaQeYK/5q22qz0mfDe8mGmWDW
         N2Zd4zr3xTt/KUPNYGQKXxIaHzPmbZQnxhcw+0NUB0mRDDGmHHBCbN974AQutXrQPqbq
         GpsG4UdlDi56w35yIiKPcOVUwVZKmvEJws3ox09pLPs7l6r57nyINfJp0rKECsD2psfq
         WCTylE8F5GFGWoe5O1QU0onydS1zMLs6WP1hlyn5KlLAewxzLYFBKsnQMxIcSvxQAZkT
         D401sJE5RTtECj/4Tw1RXgzkTeMNdBrw0weMQtHx0FMADxSdNmviIyb9n0DSuqv0NgFB
         7SCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640758; x=1796245558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
        b=YwReetHtESASSQsv6Bt4Sj/fa9w9HmlHTNLUtVPrDV116JiaL5D3pWSyVqz+YsLvgI
         JznkPsPVz3WVhaIgVoPOFPOVZpROKntuvK6i/F5WdrNy41jHDz+1oj7JxZ6NhoXwpakI
         G8K/TV0JyX9oRiUkeTfPIU//dTdjy7kAjYVa/7RTl/npI8/IxQ284mnEG9VhGXZdCKv1
         sBYCZd4CVJ0eZWJbz/UbJPYNG2N/BIy5sfTMhse6AX0JAoE9CKGcWymGcJC05tkKTNSa
         wOYLAL9/AGLBihym11x2g4UW1nnOQdYekiSu5E5rYYJzNi5Fa9fJqU354MJav9oAqFRr
         auyg==
X-Forwarded-Encrypted: i=1; AL+hErEb26fqH4XaMtq0ctC56lnMeHoxiO/3Rkm7HAWgFF2QPvhk3AtqQIm3emA0V82cq3llFricrOFPqZeJn7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vfNkzvIpzerRmOjGeXE5iJI+325t0aAawFP0a+3wM7CyblYKG
	FfIinR9Kqzbs4Qj7wLowa6TYRRJqiStlpex4sDq0tiMH9s529UPA89nfZ46zVDz7F9dT3DXQaYA
	bXarQ7dBdNO8uxVtglBUDZcM5eh7wzcgUTu3GOaNkh2Oq3J9GqI830+w=
X-Gm-Gg: AZFdTZfT1b+Rb7Am3eR5gmei8mae6D4SUfGunhyEdTJTwIkNwfBRvm6/aPa/g/pP0Z4
	AnHf9tqpbb+sCqMLU3BV0dN1uh8/ek9N/+0YfKDp2N+YA0Suha9QyQLGqeXVmLMLaCh+eM298B8
	kZjCuNGKqd8kHqTQ6qRGdSE1lyci10ac1IfEAJYNv0I3tEFJrzf6tvCW45GjwmtAXRZDhs1zijv
	XnSRPk35Tp74cI/OXDg0G8lopzJs2SjQLaqG6kZuIFApG8iAjb7Un2+NMaIdubzR0FgmVII60NG
	w7yxuhRBGrjctYShPIq266j4ZUtEbnrB6h0XPIwj9phGsO4UCysw27hDWxT10BcJHKwltU5ZzmS
	VGz9y8ZLXG0uDuBHrKYx6Mc/rq+FwZy9AT4cmXefCA+sPpJ4MD3B4Eosvd367HRWZDOwhxTytjf
	Mah7gbqxV+yn32I0IV
X-Received: by 2002:a05:6402:4001:b0:6b7:a357:3761 with SMTP id
 4fb4d7f45d1cf-6ba37ec0a9fmr13838958a12.31.1795640757962; Wed, 25 Nov 2026
 13:05:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
In-Reply-To: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:05:46 +0000
X-Gm-Features: Aa3M54rbIT4J1-0YxOX9tYrRiTVNsMtDy-V7qgEQnJNyRP6bSfPW5CTnV1B_MM4
Message-ID: <CADrjBPpxf+Df69LouGTOq4Qm4HA9HAyoKzW2Gz-zG8Hcty=bog@mail.gmail.com>
Subject: Re: [PATCH] firmware: samsung: acpm: Don't use pdev after putting it
 in acpm_get_by_node()
To: shyckless@gmail.com
Cc: tudor.ambarus@linaro.org, krzk@kernel.org, alim.akhtar@samsung.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 00:46, Suyuan Wang via B4 Relay
<devnull+shyckless.gmail.com@kernel.org> wrote:
>
> From: Suyuan Wang <stevewong@hust.edu.cn>
>
> When device_link_add() fails, acpm_get_by_node() drops the reference to
> the ACPM platform device and only then reads its driver to drop the
> module reference:
>
>         platform_device_put(pdev);
>         module_put(pdev->dev.driver->owner);
>
> The reference from of_find_device_by_node() is what keeps pdev around
> here, so pdev must not be used after the put.
>
> Drop the module reference before the device reference, as
> acpm_handle_put() already does.
>
> Found with a static analysis tool and checked by hand.
>
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Compile tested on arm64 (W=1). I don't have the hardware.
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index a575caf871b9..15d2f708b0c7 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -816,8 +816,8 @@ static struct acpm_handle *acpm_get_by_node(struct device *dev,
>                 dev_err(&pdev->dev,
>                         "Failed to create device link to consumer %s.\n",
>                         dev_name(dev));
> -               platform_device_put(pdev);
>                 module_put(pdev->dev.driver->owner);
> +               platform_device_put(pdev);
>                 return ERR_PTR(-EINVAL);
>         }
>
>
>
>
>
