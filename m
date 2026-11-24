Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532862;
	b=ZX5ooD5z+daRRAMgBBVbu0MxcOuNlNxDFp+knE13Eh6EyAkgVk15TfcTpJFyn8rQt+A7
	 yrP7k/MeohyxGseR5vU/Ba/ox9ZA4Jj/UDDp6M53sqLQ+ElzH1GkrOQjPUpxSyUYvoAkA
	 uXXRzTlaUVpBN9pSZ3eMtfpP65u6N74GpC6bISKDSr28B2gB3yDiU1ECllDxCver7eSxM
	 +AhpywARAimyzQIgOoqkKWwACFLsSfAjoMFtuEZD8mSjlnOSW2sHZh4e/s9l4NQNEjNOl
	 tGG/J4hw5CmNb2wwztFEOGFPoBBtZZR27D9sQd6+lwWR2CCPMuyPoBAnTFqJYzhaXkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aICwJf3rQzn9t0UhzA5pRAC33uHfknWgbhObwj4iPxQ=;
	b=dT3EzqQ+oGz6CQeE9tOpCjbbILNahoDKsGOr+RcrIHjByTo3YkoFI0eRws8u5hVoqqy+
	 A54lc84Zi/cFHtD+1NRxPeC/aZf6/ZjOEjsbQe4r7tSj8MEgGOhrklNdP3e9ZWHMONhos
	 VGWvMvFcDcxYgfD54nzuZgwNKJE+WcoMQstjguy5eZiii1w0gBwaEi8qvxXwoAY1vKVH6
	 WDza+bHTHoFGFwQZ2H8YQdUewH8kl1kPRLNMJ8lj5ycd8cTYtAR3HZppdvXHJM4swSN0M
	 4t8pCRyLkOH33iwD+5p/RhPHgmA9LCJLHolJb14CZuf3sC2J1rzw5C3C/CnpCfsllgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cA4kVEyB;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D854606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D854606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cA4kVEyB
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3adf222704dso5312131fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532860; x=1796137660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aICwJf3rQzn9t0UhzA5pRAC33uHfknWgbhObwj4iPxQ=;
        b=cA4kVEyBti5oMLaeq7wT8khKjM1DVQUy5qVqtxYPOKnvBvWTxo1pJMgv+xaOFgWBV8
         O+Fb88txNYas/uoXAuVv8jncx+4khzepX5H9SQeIAA0HH4mWphgfrDKfIWzSZzRY2K0q
         L3JiqdQP3BmXzmE48NqmXEOQ4w9fd5OmD+IVV3pwhvkdPK9iFj6oFwLy7KD89+YwQnwn
         jEEdi2WnHYjGM1YZlmouHQjy7/zQaXqf8kxrhBTCzLViBNKtd6rju2hQasrmPN3W2EPa
         zrUL1UjTLksmq0aTlKUCLYp9x209mpDE958BOSijHdkEhZkPtRsYG9SYBpJRVn+VAr2R
         H/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532860; x=1796137660;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aICwJf3rQzn9t0UhzA5pRAC33uHfknWgbhObwj4iPxQ=;
        b=h9t4JNXJA7fLtIToY/heuna9nX2nW1PDJsHesglDaCgYFryrdLFPwk37cIwzSaI6SC
         nox7LDZfo3R0bO/CQgbY4nYztkpD0qH4hXw0MholqWOMU4V0wGFDmK5qytvPwxVmwiUR
         WDZQ+/4kLBgCqkVmCF30Ugom5xn4vrNZOi0/g0Vrn0JFHbQ1YgwA8eRHURtCxrgW7T34
         pFFENTWpztL5KH4o2D4cTdOKFIGyLE1BJfdAItmTA7/9HPLMFouXIdOs6ztV8ac6GudA
         CySOTM7KRXZruOq9doajMWEENkeS6eh5dAk9Rc1Py11IU+WNUYg6N/EGINq6+t7+txfj
         2XvA==
X-Forwarded-Encrypted: i=1; AL+hErHeglJT2RdLuv3CQ2knjLBUkl9hrhNF8hzA7tUPG2LvBbVDYqvdbS5W4Un1ORcSLwS+1pq3SQOjkLhS9Js=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PJaeeeSQ0W7ZFLIepy6R6UqXCdWwYPphlRPtoBYBQpVJeHHiY
	/qHshMWjwCmvB2oYqx3qmKVLThi8rpavjtfDjtRSva5URRw6rjh9cS8ubl/64RLFkpw=
X-Gm-Gg: AZFdTZeUe1owOwtDT1WJbORsw6Hn76LV0xiE5ZgWhLnBZj5wJTLixzP/F4O8zbiMjsU
	3f4HD9AaG1dEQnEC50wtRqAwNZHraCrjzwM6IkIKej3TAmnLqtB0hD3k4qvhfzpsm/HC/z2bXyw
	Y1VEvgXEraPWYf3/fne3stvSNgpFC8XpAOPst7Z2FjTHM3pRPRJNM7GRahz5UAu1tadefiUCQV/
	tobMQ30SBtG6JU1Yq25Cva7vdcZ/gmoq+qUtD5AOKK83wjOK9fm7zLOPjbvBBqxSSTbAcDZ490Y
	ZwZm7zVueOJllUPTKoGHXalSUh0TjWBnYhGmkH4XekRrJPfXcyzrQx/c5yUtWQYSWoscAEEHnWz
	ET5N8wLBLzb02/OivVdFL7c/j8aOczG9WnK7+XCqd+8b/zEK0xV2y3WEqDVnjmk49MPyBJ7QAXH
	j1WE/1yesx2wR1g0yaD8kMJjBT37pel8kgHu5c8c0b2k0NG0ankXcxv0ipZlXvkG96KIVZ5QuoI
	d0L6CqZ7zV1uI9lzHYMQj/poXdDEPSf7TXSjj/u+HY8hqsldZtW3rJ8611t43We0YtH9W2tgoiY
	/D+lE70MvdmeWCGqbuK4Ci/BC7Ymu0MoCRnuxLy5UDU4dZLNOhrPMFhCnBXgdFhvMDOEiTSdYYA
	iIeS3vRI=
X-Received: by 2002:a05:651c:a110:20b0:3ac:dde9:a04b with SMTP id 38308e7fff4ca-3ae7f7cd8a5mr35764001fa.0.1795532859714;
        Tue, 24 Nov 2026 07:07:39 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm39335071fa.21.2026.11.24.07.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:07:39 -0800 (PST)
Message-ID: <5005ec8e-bc15-4962-bfed-74633013115e@linaro.org>
Date: Tue, 24 Nov 2026 17:07:35 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: Fix CSID to VFE routing for non
 ISPIF platforms
To: bryan.odonoghue@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 04:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> This patch fixes a basic routing error that has been present in CAMSS since
> the addition of non ISPIF platforms.
> 
> The ISPIF platforms can route any CSID to any VFE however this is not the
> case on the non ISPIF platforms.
> 
> The current requirement is a 1:1 mapping CSID0->VFE0 CSID1->VFE1 etc.
> Demote the spurious poly-mapping down to its 1:1 real form.
> 
> Fixes: 9229b53f9758 ("Revert "media: qcom: camss: Restructure camss_link_entities"")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
