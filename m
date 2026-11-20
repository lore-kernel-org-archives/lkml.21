Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207345;
	b=tOt1mYzRX/skvntZB7v0iNhnhzT3DpkJRKfBFHMMbDkJrTtPevaqltF8ti5gIfqhe0cL
	 koj7nHR77aJZjd0cnqaeWCXLDqum1xXoSm/cnNTC/pd1sSKo+AiG1QAZDzdbM8cCvOJqT
	 kKb2LFbFKP8RugaU5ugh+Ymf22ki6UjvWXDPxHPjfajYQsm9N7E44C9Qyc1lntrYOzpW7
	 uQFFu0ZxrBAIVhrz0AWgUEwE8FS6ti/rgeCp+kkupkbIH1wJKj/im9ms4qSoQQrS9mpL/
	 4W4i0KHw5G/+JxVFFynCLgfmKfRUwtYLH8mY+bBun7J0OtBkDcNJoL3U2Lhzgu5IwIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207345;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=GAbvZ3pPSOrdVekXC8XU8MwNJ3POcX0QULZFkXtCXJM=;
	b=m45L0sVchnJhtCvKwjDusiaSB7irnXwA6vKMSUYGzXyJaNniQhdVwQ7E1Lo4y+mtifkf
	 2QrurF1nEZuWpL9F0zJSMGnF5nvIQXiwstLU5zzVaeVhUZlbpcEBH49WvdcfwqxBshIAB
	 OoTp/4wx20DRIud+ecG10Yhug4da+DsZOKw+GicvYt8u/c3kazyOWpJH+CkXnAEYXPjme
	 AM5Df5YbpKrf2xfTO1AoED82wS+Tpc74pmPprNyzV54Xr/sEggShOm26LZQ1HPY3iVctt
	 1wTX4Fa8m+SWbRhP21VN9V+hG836L7ZTolA0pRj+L30rX9jg4S8vK+fR+Ab3FwWocfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9492606A6D9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9492606A6D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53639b8903bso16490011cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207344; x=1795812144;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAbvZ3pPSOrdVekXC8XU8MwNJ3POcX0QULZFkXtCXJM=;
        b=iSrTk+Z/LH6R6o+Ajl4QoHi4HYpuqsZhIFEralHSm78NmkCyHNVeaHN4di2fWFR6M6
         HRQfgVcYI7G291Xf+sYBRVvl8wCQofr7pqIAa4tYSG7IW3glq1vtzmsM3YUTrvUjo+RD
         9AUpeN86SlsdkL/JFnN8Xj5ffgAg/jIBmXkQJFwCD2FykUQoIexEkTvCI1QwFAHpD5WM
         CpZd2aAApHZDJS9Uz5U5hWwV4Oi+z3l1SeNsVriJRupcoAiXX2fRpYIwwCZodYOnMlO6
         TIEqDPItuVaCEKeie8KEx9aisU/EPODLm9VXyr9oPLauFvDvc6NRi3JII0PenQKqW6b4
         0+2g==
X-Forwarded-Encrypted: i=1; AL+hErFtd2cQyA5wg6tlfU+8JTIfprGn6ZzyX0MbqirmkrpSn0DSsQC01r4l9RszDhDZM4eFqxwPCKEVGUcC6WE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jObH62CstfpkvymKKlnKbqJGhJQxAfoU1ifGfTUVcMXlmahqc
	HD6gyPt391o4CBQnA81oBNcGx2bbxNMP1qZHz76lNwtp5tWz5NRhnqoB
X-Gm-Gg: AYBFou2aQy2zpoNgDF/I7DpBZRqlfmp3PdjIWhYP9jTXkYCpp2OFsOET17GUUG9y4BS
	RMN02N32ElCszFnJmUTeasYriNNx6KEbBBxVDRZzvaGu/co1qdjDxGxbikY6OQscqas1rtlt0nf
	9Qkv/T1VnFHHJe1WbrcdBRqdLGxHgKHhRbhguddkLMCXqcajblzk6HlyRt55riu4Qr95FIiayKB
	OJMKPtrRV2O+Iea91Sz8N0aukwcsQrN9ayjbVj0Ow3O7TCuSt7OAr7wwqhvViQYZZ1OmtRx5suq
	FTuebmmBGJ2TC5G66VXFhkWuWNPwaNVoxXV7MQcqRQNovXegFz8F1vjQovuzlRv6Ktkfgtdolik
	eo9M2yB3hVhC1JUN1ZhsT73uQCCP/q6gCSYME9LlNQSpZAs82rGA2qoVGBJEtnJzadu7knHv2lL
	TDe+jkVoFikdNiQCrsV4Umf0Aapd7zNOs+hLq7Khi6d3S24MXmpbKqxC3PJFkokIZcaOLZU8k9R
	xW3wcgosw9VzVyklg/ixAr9lU/8U5u60UAkrssR4FOCp5NE649eNbt+u8HsOkIbloJj+Z2d/ra2
	yreDfdUJRH7/CXX7HkNpp35Ww87+O8XYba+ZVHrbjjBDosy941SsAwlN9I/jOe5HHUp6dREC/5G
	pcIn4A8f88P53RcYJ8yRHzqKVDTc0eohuxupw1vG0GhDGMCIlQ8Yc
X-Received: by 2002:a05:622a:259b:b0:535:6e9c:d374 with SMTP id d75a77b69052e-55d6fcabb67mr91725931cf.14.1795207343793;
        Fri, 20 Nov 2026 12:42:23 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78852bafsm32418241cf.20.2026.11.20.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:22 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>
Subject: Re: [PATCH bpf 6/6] libbpf: ringbuf: Reject overwrite callback use
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711430.18576.13986256491021949684@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <DJBZ6ML455FF.15NG4FYCAX9DE@etsalapatis.com>
References: <20260613-bpf-ringbuf-fixes-v1-0-e623481cb724@kernel.org> <20260613-bpf-ringbuf-fixes-v1-6-e623481cb724@kernel.org> <DJBZ6ML455FF.15NG4FYCAX9DE@etsalapatis.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Nit; unlikely(r->overwrite)?

Included in v2 and now merged as f756eedb24d4.
