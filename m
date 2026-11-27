Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746197;
	b=kF/PqbpL4+CO3FjRbCf1aLNdBTOIOYg8zTPTmF04j0peOpQN0j16gI8qNBBEt2lqZ2Sr
	 xEYwb6ia+Yug0DFzHVEjbZqrkHL7sy49itqngiFsHaQlxmwbEb6Hymx+hsxdqQOeojj9j
	 WU8ck0u4/eiKZLLJqACzeD1l2+lvzDF+YJDDK/CbfpYSWiY7kf8qXsG0L6QkxDTZPCbJP
	 MaWWpX45XhV+5qLYvMqY0kzCPq6weyGLuFisM5cUF6GqwX3Y3Xv8DMu062gRqDFj0KQ/b
	 /J7OQfpK/EbvK+oqyilzNjcwm9uDd6zrQpdTQa7Lg1ik2TPT4uQsPiBfW/FtuxTQLyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=Hx5DhP45Gc6LodtMts6vbsFotwIaFwhRMtG1SHCp+jI=;
	b=a30Fyt/8kNGYcX+YH+5rqDPVvLHh4ZA78ERlRb4+f3uJWO1UasGIV3pJOGfIqQ5koIkm
	 kNbv5LvOwWZgfzSrz4KKYPJPSYRXVQRbD3yWueVqllBb1KPKWts1jop14NRcU1PT91CJ6
	 cZE8Rzme/MCPbybznW3qICOcGBsX8YoVq26AiI+cyl/+QFxaukB4fTWRZKvE+WWTYxWr7
	 ENgn/+qSG4B3vCIbRVzz6ohqc+w/9BEV0VNBDffFK0la7SAwItpQCnDgzvveBbWldbjps
	 lDxD8jfgOJwunItrhPnEIKrTy+cuKOactEGqKnTQjdS9Lv8e2qG4P5jpJ6zBjwOAP1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dqMl5Dxa;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3633B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3633B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dqMl5Dxa
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb684859cbso4454389a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746196; x=1796350996; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hx5DhP45Gc6LodtMts6vbsFotwIaFwhRMtG1SHCp+jI=;
        b=dqMl5Dxa8ui2tYtUU34qw1/s3jMe29dtE9LX8EUNNg7Q4/XoUt156/NZPFvPzJh/LW
         1/Q+VPHxZo+uGF3JdMWPljAjXNFrZjqoSs6W9b/MTnEQB1MEeMb+3Gjq+ksx3xqpmSrY
         Isvqm0slSmk3/RQL06qmRXMQ3eV9WapUUTEazQ5ojU/PXnAQVSjDbeg/q61oWyT9aZgH
         7n1C/A1dmP2Nf6SMZfjNYKeFP/cQ6n33Aw9/wpV9oObgjwdTSwFLbQIQvd5gT9y5Nejj
         WJKNeheUTSwCDXO5Vo5S8yizIvPNOLT2N0brS14f1Pc2ydcRuNPV1KGIpTIvz6lzvt5h
         o76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746196; x=1796350996;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hx5DhP45Gc6LodtMts6vbsFotwIaFwhRMtG1SHCp+jI=;
        b=gSXVTuHZyYeJQxTSYDXz2LZBGeOZ3sVz4xL5T0VsUB3xJo/NsxgCRsv2/5xkaQxv65
         vEhyZzGkiJ3jHXsY6Ui7AqP6YMyEJICJpd6jN9db1FIlqsZCe1rhMvVd9SclbMNZLuax
         YKhVVigVQQnScMbyjTXTEe5AIUDMbcbJPA5XCrYl13dBT06CRCU5OuEovUMN/96AaxvD
         qSMxD9jqzxlK6c/xGmKDtiWbTiQpI6Tg5AV0Abqa9ZRep3uEBb55UcsY729+8YdoSKs/
         qZoSbaQLCAEwjTF1Ygt3xRduo9wUNBkNimKeS7ukLuB3vf9BS+3duo/90iuaVjbFjKKu
         pAjA==
X-Forwarded-Encrypted: i=1; AL+hErGo/xnsEFpRSG0Y92xowcKYLYFXBVPmGLm4DiwmloPHgDgM+C2Tt5d6RcZRro39DP+JL03s+O83M02+RAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q5LEHA7oxEO7PZl2/O7rwQrriP6Mr9gmeKx9ieAPY/L3RTCdJ
	KgKBxrqPCUZ3H0BmhU+0XGHW4joZ3kszKF4M2rAD3ahID5t7eaP/rV3/
X-Gm-Gg: AZFdTZevlun1cmynTHFckC1SMEiCb1homzPt0k9ElZ8q+YNsVNJfQ5f3ZMjeOECO7Aj
	RGlbNNmDFKRMcltEEhda9hSLV75BlOOre2zthsg1wlKKdt+69n9vtmcXaubDkEsDRvI4zW2bnQj
	oMQ9w55XXDbYenZ7M6sq1O4kj3slJyo4PDnoCOFUTiWNpMZOTwYl8NVQbNW0ebFeLaD3IcXWLW8
	6rw++mkxh1MqP5tzP1MAg/lSzme6wpVy3vnNkQdrciftOKfBqUQbpesoI94hl6rRfVch0gJ4RFp
	1Anzqm6w0nHmqVFFVP1/OepcJTyGRDJhzAhPl8kBxBXsOucZPZd7WIWO/eZTf/94Ye2Bap6nH0E
	Nr4AZFBnwObPbjd9JmCaa7pJrh8/1I/3U4VhT8+U2H/NfbfAnVE/bw4N2TPqy/9Hn/0Jq6wkQXK
	M3LNnbrzGPrwm7tMqA/FOY8qreJmnRUHJCl7P99qOEg5HnFcRAZhvFPqJXhpTWK5b7KCpc5Xns5
	38VNIq/6UNbvDLy5kpAMGjO/f51v1imLGvRXy52dQ/73urm5d2Iom2EFt6yoOwQZGeQ4Pa59vF9
	nD5DoKl1XczDY0y9w1E30aWwfnSROsJU61H63NpgEkRFsSH1fnsfG6GjaVTNKIT7n/NS9qNUJjA
	=
X-Received: by 2002:a05:6a20:c992:b0:3e2:3c7:7754 with SMTP id adf61e73a8af0-4014d25482emr23831723637.65.1795746196540;
        Thu, 26 Nov 2026 18:23:16 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdea2aed207sm5635547a12.11.2026.11.26.18.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:23:14 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: mt6359: fix MT6357 ISENSE/VCDT and
 MT6358 VCDT request bits
In-Reply-To: <r7Vh1EmPu-wr1NpHp23HZp7Fa0qmIAj6FTo_g8upWCKPJmnTk4kpjHxcDEjYankGVSc7WkkdWEklsFFUDQBF_XRB3GMM2XauzSsdw39czF0=@protonmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
 <20261126031013.27701-3-iasnezhkov@gmail.com> <r7Vh1EmPu-wr1NpHp23HZp7Fa0qmIAj6FTo_g8upWCKPJmnTk4kpjHxcDEjYankGVSc7WkkdWEklsFFUDQBF_XRB3GMM2XauzSsdw39czF0=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:23:09 +0800
Message-ID: <179574618985.4164.4856012256948069545@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Roman,

Thank you for testing and reviewing on MT6358! I will carry both tags
in v3.

Best regards,
Ilia
