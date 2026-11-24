Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532816;
	b=fRvuTzNtS0ZeiGD1TZy1TLKQWEq4Ql03tpZ12OfYi1z3eJojD4qPmKiqmzU1nV7YE8K9
	 sBli2sDsuJVBndw6j9qkgQHvlQNkpDXllf+mN+w6VmNkvCacF7C83FeXlKWksPm92Q2lt
	 mMiIRnsVMCFgSuVwxAFFj0Qt10KQnzxM3zFUieAvZ+VaCCH3XKXRiDbMJ2mWBfBoNnLQH
	 ntjDZaY8eL4kcUQQaPAKHTSGIYd+3krZXWhqyg+2cMUGbli4xOj+o754RPKp8bYBd3Cjy
	 r+uRfz+CHmEev9dinHg+TMknLX+OYxQOdrvaRe1mH3p/NxZvSjxoidW9xPX0GpwukIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oOGWfW6J9/RUaKFX8kOnCEzjawMWRL2R6SHNVvIGRwg=;
	b=EaNkDRv9Jy8ZjbVhyDO6UJlM+LLoPuw/YLfy+zViM+K9RSJ0uOgRFm5qKP4Ffkw5HX8q
	 IckqCyFZO51N85ShhCAFiAGxeA5fOQNLzD/tlLPpfvwbljftOuQ/VnyFydx2VVi1HXRn2
	 mIVagPeTheRAPQOeUQte0Zgyxts77SnReJv7vjo8QR0lQhMBhGUN73NYqu8ntUEUAUe23
	 YTX9wLpTGhSfHn5zQzWUCF/zXocsZcLjDqB7CHBalmN8r3WrHBW325uFJwRNr9PZtbSZ2
	 nv9rwmx1ud0JmJu4cxcIYRXJYOyw+WDZg+UpPmFIxSqDtJQJOC+7BOoPNUCWr8KQ+xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RnvlXEeB;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7D606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA7D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RnvlXEeB
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso622938e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532813; x=1796137613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oOGWfW6J9/RUaKFX8kOnCEzjawMWRL2R6SHNVvIGRwg=;
        b=RnvlXEeBifVUQ8kdEff6LkQT0iyz70rl6qmjWB7cGMb+fxvMLZcUQdUewCAZK2jgmZ
         uyAgNcqJEA5LZ8AbCqx8z06KyYov8+5GFBpKwVpH68tDoeMhiczdHWCew15PiwmMpgcz
         63BCA+qvFTOHOwepNqqHoeVWxlkn57Et2BzKO/VGFZIQSLn/u39cU2pDDs7GwfK/+AaB
         e+tTpY24ekUpmMk5x82yMIvNYkk72dtSxs4D7JYhY23ANxn6czXwNZov6EyzWkFwJLVi
         ylMcBN1nY+hckUjtnojsNQkE+uhtJmXYSzrTycddqnIuT0/B5336xi2hqVMpTLoDQlvh
         kpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532813; x=1796137613;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOGWfW6J9/RUaKFX8kOnCEzjawMWRL2R6SHNVvIGRwg=;
        b=v65SH20FVrRXFdgu3rlHT90VIThVyiWYg7I5DvCTxO0PRZKTrLjyqyVQLlfWu58xxR
         I5q+2H6UEoB7zYu8TC9BuIbQnldwMEwC72DQ1hfLAemN7VBu8rkRmC9RJJDwCambDjN4
         wix2mFBiHS/1iJGnxjo2rqql+fX1mhcZtsuAS42mgiVx02FpYOpnatJTsIhdxX9MssYD
         g+qTwiT1Q2+3Da0mGweNWgIyOriNoAXLsfIOD0Y6IgrNFIdiUu8pFWVL9Qas53OAEFk7
         ErOgM4KphNhcodvRjyWYr37D4gFeQqzxwLGCyPpHxLrpo4xPtQJzt0iHh2uJYCAkaGga
         ETTA==
X-Forwarded-Encrypted: i=1; AL+hErE1uBtHzrNg1eNZzpIyATRDfTIP1alSh3psc6o+6votVshN3br37DK5SxMDy8dvqGK/YzTDiN53yZJlKbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9umD6Wz4OTsqEiSWmHb0nVa23Rt+dXV/DGETnUSKtxzPQ0Fh7k
	L7wI7ygol52W1nCmULWRtxbYsgsYY+CKsxsc6iggsTTcD4ouUFHHQ+5oMDcDRxs+t8s=
X-Gm-Gg: AZFdTZcqJrUDE/9f7hoWGREk96tNRlHp9zp2cLCjq4sGIJ+cd/p7owPlKmlubjYnX8p
	Z+MDF1KtGIOEMkrSTgBe4F2VdeTjsPSEUMyxfx14M3jMFqQoMViU0tpPW0rxA6WmcMWP5wP0nJ+
	nYb+b0tUGIYUiIswsNWHV0GJm5vAEBvuIXNXh0aX3Y0yINkqj9UGYcrzZjqOD7S5rwsPAnZ8Irt
	JrK64uveW16vylBqM7a23ifVv/ZRC6KQoHtzQ7w4y7sqIVT2y2Nb15z9f8a36WAzMm10cmcwRW6
	0FB8oRekHUXr4tigxGi9TeMhU3rppEfAjDOorJdkxihLXu7ipn2HYsBxgZIIB9R01/Yvqsvh7ia
	K5ln8RV1DUvDJkH5qclguNT01f49vHxOW/OT2+EuMl0qRbf6XhVMXsGdLgZWd8SZ0RIGit6Wy7Y
	iyNQ32L8T2U7L7V3M8QN001xl8vixvsQf6Wyj2yJmPMCfV5+0sUBijv/naAFS/Ex+aRIHkgzCHo
	7oCfFuTM70RE43f5XMdmN0mHM9oBe4J4AyJh6z3mkY3PiItCHd+q4KtHYzdZwmg3Qgclazy3ErM
	ZDhrm5YAi4x3NiNYjol5XcerC61zZRSsltlyqkLOeBig2P8j3LU5M0BaGI2n3C/K+2XvD/+n2d9
	d1cvf3om62tlIOV8clfO70bZHbBkB
X-Received: by 2002:a05:6512:23a4:b0:5c1:57b9:90b2 with SMTP id 2adb3069b0e04-5c1bc685e41mr4958216e87.1.1795532813175;
        Tue, 24 Nov 2026 07:06:53 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff98c6sm4038388e87.25.2026.11.24.07.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:06:52 -0800 (PST)
Message-ID: <769c2dd4-1517-4a45-9694-b65e7b4bfee8@linaro.org>
Date: Tue, 24 Nov 2026 17:06:50 +0200
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
Subject: Re: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
To: bryan.odonoghue@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 04:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
> and raise an interrupt but it can't drive any VFE write-master. This is
> basically useless and not worth coding around in the upstream driver. If we
> find a real use for this we can turn this back on. In the meantime drop the
> definition, it only confuses things.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
