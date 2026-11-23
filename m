Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440791;
	b=a+eTQgBHr1uUOeweUpgIsZO/GE2HeyXe2tI6xKJxp13i0uhuINKzmr9I9h2IKjnILSv7
	 7Eo8c5C56FN0ucpHP8ZzBsaw/mBwgPZf6WCEgOrW9LTpfgc0yRocJ9pkb3P9DZb5M0DUg
	 QacrRkW8zfYZSGtn0COAfup5/RX6yV6oGBlteNsxsRnYFdrHkebCDgLwA7yMtRwX2PWhQ
	 0o5H+ODVV5k1RSx6KCHvEax50T0F5PHvEWlmznQoh2XqY9A8UZNV9ZufScjSlWaUKFpo1
	 uihJnXXfuajeE324TnWOLT+cIc41bMmAZaZGTh4xKY5rOF/1iucZzXkXNjx8FI68Ceg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	b=ihMp48ecxhY7ivElbU0SwtIXlGp6lGfsGiG1+9tTuhETHwuUbub4GIfgamasbu1TG5e8
	 qAoDUI7tbsDfauUcQIbCw3O6oyg2swTA9IxtxFjtY9fp4ADmembBB1I+vYMWTJDMm77mj
	 uDMjSCzyroXnLCX7rJn57fTvGef4HzKPAaB5RAknkaXHzYyw8Fwgoy62C9nhUKv+jT/Ig
	 +1lrre53gVlEbKktMC+Lu/GG+cRtetOSNpc7cuIvohQDTX4VFHT0Ahtv65msfWrrBNkRi
	 5jQKtCAwvlLKv/GNhTX76XH466T7HmGqk7zcltssz3UYYhnj7WoenZabddZgP+KpaZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KwzhDLrr;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2C8606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A2C8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KwzhDLrr
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50e26763a4so605811766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795440788; x=1796045588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=KwzhDLrrYMrYN/9iLc3BK1W5Hw/5kWfO7v8nt+f+sJFsKTl1Utb0o6LSAQuZwIR1s+
         tt5lwGKwMNdrDOq8C7yG05WzHnAREQMH/a67iCrgl7VqjOGup1YpS62k31plfLk6uhaQ
         lsxlNAxVQejQuce3fZVLmhkFdeJIU0WnMT0LTblqiA9Fb6e5bm/wxHQbfZ+rfzTBltm3
         7NqW3h+ZqSF2X+dPo9FFleSMpWAmyUqbjHRCqLl72GGPrp03dEabacwg7Omta5LIl9cO
         8B3FpHWM9E0gt+hQooV6hy3b8p2xlRbnOI9FrvB4h02ajlvKAZPc/8EMI0aTxfTqiEXS
         QELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440788; x=1796045588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=z0sYObbLTjc7zjdFyWstniIlKBpsQXOpy+6W9YGnwoRoX7GXP+C0ILZaY0Q4215PwP
         0fonCQDsuXdFlHfSOtWclKaDW4M9U4OHzy+lWEzswrXvxYl0pTHKOUJxjpCbaZOtplee
         nrpvsKDyNJDE4I+IJektZCwmh+PYcmzTejmRFNnc45//1VotRK1peXz0CKxBQ0/jvDs2
         R6ZyFn0AfBJv8oDI7ciqB0XzWZC1h2GORsCYFtNOXp7YD/lDRZck+LMZEjf5z7rbFPlq
         /mL4X3rJPtl/BOSenA4tffaT/aMSobqA7O17LKpBlmS0N+dpI5M+/XWL5NscxzHlz+ab
         NH3A==
X-Forwarded-Encrypted: i=1; AL+hErGZbSX45oz2cmORJ6Us023um6BEhYue83j1b/pAHNxBJzXICqesvDRz8GeSh+YdGplvvAl620bD4sdJDgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xTiwLGFME737hCyR5Bw/lUPZwfwihr3W0o5teUQm2zMFFB2Ea
	GY910TbV95kkJitQ5LYy+Dk5muBQnvpyKN1vpHGvfWVyE7sP2MZQTDF1pI3fozQwOHU=
X-Gm-Gg: AZFdTZfWfYFL1O+YtMQ+1kxBJ9ttcLn4NCGn8tchgkXEmQDGCyHo3bfcOgVeKmliXiS
	zbjWKHjDV6awbT5VWPxWT1zArvFBbVbPleSrs2Q1CmVFuJqLZmE9ULiPKPrkGnp/C3p73FI3V6u
	onwuuqGsqI4QijmxexDMPknZFUiLt8jucXom3FntoT+Z9GC1UqFy4M9pbtLX6aKldVG3JH9HKGO
	JIxNBqEFynhCykKxTXeZE69nOSyb4rwQBf4dYkznD00aBjS1yWiQLX04YuWO+t5/i6zj7y/HmHx
	q13zaSVE5/lIZtAwyjVnsl4L56K5690p24tl5hOWqW9JFZQmPUZIOY+J9E3MnhNG85nO+0CX0yx
	DBUklmY+f6nBPtfIw1RY3m1Bk21hwRCoyh66eT7agkrZFbyLRVFSRr0FqZTdUaAJFFvw/nCARyz
	S3/m7l27WDCGvBLGxnKxa7ykVl/rPHpqjJSumzsUr4tm6b1DIR888DDHvrrsCgG3g8nc8q7ajkG
	jYEJJAtCES4NDKHrm29k47SOORZWsRABh65m+5UyrDIFRMEKZH6T1jfkH3vL3m7f6++SNtjXkH1
	TTi7gROtr0ATAehjeplRM6ij+dIexXI+chIJexg=
X-Received: by 2002:a17:906:a88c:b0:c29:22cf:b0f5 with SMTP id a640c23a62f3a-c513ab3ad84mr761410766b.33.1795440788381;
        Mon, 23 Nov 2026 05:33:08 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm407213566b.29.2026.11.23.05.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:33:07 -0800 (PST)
Message-ID: <c3200683-9d2c-4ab3-bc7a-d78452456bf3@linaro.org>
Date: Mon, 23 Nov 2026 15:33:04 +0200
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
Subject: Re: [PATCH] firmware: samsung: acpm: Don't use pdev after putting it
 in acpm_get_by_node()
To: shyckless@gmail.com, krzk@kernel.org, peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
