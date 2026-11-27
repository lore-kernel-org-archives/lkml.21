Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799343;
	b=bHn9cZPI2PU6GphJBo58Jk0ghDMcqSOM0sk+C8GXS9V0CxMY/BieAiKR44BWFeYBPFlk
	 DbVFAUywSQ3mW/3Oi6NfF3RFMm5XCTpg6pl4ojOAkzp5C/l5pnSnTy37rQjwb7IfCJx7l
	 iwSwED3snJnlcwhcpWuEgMYrkfVkvZDCIqW+JXIzgU3crwHiE2fmgtyj3K+utPUvRdqiO
	 bif1sehYQCFsR6KhnWG0h/sdyNZPPVYgOPk1hi96gRC1EYVq22zaMDKBkh5Pryak8xFQa
	 ciTeb40ef7ictXPlAefJ8oHejnRRArQyrU+wsdQ3tgk1LI83fjvb0j32uP1MxQj630Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
	b=rGT7119+zFmepq4uMcjKs04uu+QWQF1ZyP6vGI58WdHpKGu9wURLaddcMl1SnwRzspiT
	 HJO05NNHMMGKg7k+Y9LXT0nJVWHowpT6j3qitSSgY6DbZFD11+IT0hr5SFfpz3W5lI3IR
	 nXRJZHRt3VV27DdtneRFaZOnxQldqdMHt8w0snUjwelsDi1Q8Tx7V9jPl6rtyXbhRwYlK
	 /elXzsiPWb+AArrCAglsNLRz2XOLWcJzLj1DOGqn+pvU7WtZ/X7ga4qSPZ4I5xYTCmEVV
	 e2+L0cWgLZA4Q07QlKUlf5jFhVpW3jYIVNR9oMaBCniSc3pM0nlsTxRry78YeQgmmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NpcMn18Z;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FE7606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NpcMn18Z
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9211efaca89so27298326d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795799341; x=1796404141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
        b=NpcMn18ZOcBUH/K57xXEmosR6TjqGtaHb4iOQyIq0GgNDqO6dAa3ahAGzdoMm6DK/R
         3dkns94RmQsNEaf/27kIYiOKFNzoSKhIXNccUkBguWLK26AIyGo+A089UsFFPfbNz3JT
         fRNukHbF1g5uEH+w2aeet1LpRPQxG0BgLshkGNvKg+X6WFsNVdvtlTlH7jbh0mMU3AE+
         droQd+7Wzvs1ZZv0Bm+V2UKWtzqHa4QvPeJsxPzSnXUzGeAIakkUFw1mjKjdYkbgy2S8
         Y9PJhCrLM+XiW39othsK/ZS90eIpfnqQ3cGzLWFY0EcectQslbi4vHXfem+Makltaxhy
         GuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799341; x=1796404141;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
        b=Fuxx84fYndat6e6VwfYhZPGkDSWrrD0Eopz6FE9eOUbzjmSNGDiG+FvK3xhgc0ZR6U
         0RJNSI9AxJHkdtIoVvF7V+QT8YGL+v4xzCvYWI8RlHcgQ5nA4kXFqTtcxDNBMjeD12RN
         DQJANJIyIVWn9WgEeTnX5Cn2MfbU3/oCU5yJg57qjxyAbqkIffvusTx5DIf4UhRbabUf
         2YHoQxFX5G6VNV/XU5vj007yXp/zrzbpcxWuJ7KtIBqf/6SFivvgjzsMrGBtnX0TN8X/
         BIjtvi3D0ouDsi1UFfubzU315hyZMjKk6ntjaUa8W+SYFqJNm56OPMegQLNjBsdHiMOu
         J0fQ==
X-Forwarded-Encrypted: i=1; AL+hErGYCtH4wBGj7NyBbAoeqSrQqBd740aJ2Grspxi6A6SQcXzJLDpUBTzJQeAB8qXrhQH/8CW1RY99MWg0Q4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VK2G3W2tgjTRIxbWUQHjxCq1l3xTimSgmi+h2Qkts4mQQqrAR
	W68hZerre252VcwU7FgUZbYVhII4RqdcZI2QdPequ16Uo0mpkSBoWkPZ9kSJmx1rDmg=
X-Gm-Gg: AZFdTZeLt+lTuPdCjXC6XUHjH5xT1/GTl/1rvVYyqLxl6E3Wn4cP6O1tsn+JuodJcoS
	TnOz9PbfxyQj+ifMytq0Kh7iS6QT3VuVbtaxqvrmRVztiVSbOFC+6NRvv+ksDklnlsTox9dJzeJ
	9jqAg1H36VUpRZMldJFoNUErF34JcurFox3bh2nQbD0NH7N8sDiEaxtRfObWBvzsWnVRG1yaAoX
	2Dg8h8Tl4zk2OBm7ZQ77cv03YfWFXAeook3hav4BT675NuRk38uP8o1l3vhCYSBlXmc86mOcpge
	m6HR5UI4kKT8nvUwW6kuVmH8gHtedPSHOnNvOrIc9+/7r5itTL0pvPXroxWI7jy4Q+lAgW8BIk7
	nHea1CBsirRRKrHQ3R3D/16F3GVujAUwqGeFkaN7kqTWGY0ZtndsQ4f5a9tMyI0tRh0SeTaslyy
	eS+02FzHggjEmyxsg3YmRWKUPU7yWyFHFMDyFTyyDpee9KTZNPc/hsaEKwixdhuNzlDgyhRjujv
	1iw7MrTRsZPO2PDWcjhk/CVBC80ecVfyVDImkTImw9Mey8OY150YyfE9CaIOLnO9q+3GL1KMznq
	c4Vc7Q==
X-Received: by 2002:a05:620a:7206:b0:94a:889:5a33 with SMTP id af79cd13be357-94a08896165mr1311739085a.30.1795799341642;
        Fri, 27 Nov 2026 09:09:01 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm1875035285a.37.2026.11.27.09.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:09:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWzRU-000000079ec-2Xcr;
	Fri, 27 Nov 2026 13:09:00 -0400
Date: Fri, 27 Nov 2026 13:09:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 8/8] selftest: attestation: add
 cca_guest_attestation_test selftest
Message-ID: <20261127170900.GU246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-8-df3230afce8f@arm.com>
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
In-Reply-To: <20261127-arm_cca_mr-v3-8-df3230afce8f@arm.com>

On Fri, Nov 27, 2026 at 03:33:03PM +0000, Yeoreum Yun wrote:
> Add CCA Realm Guest attestation selftest to test evidence-get, mr_read
> and mr_extend interfaces.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/attestation/.gitignore     |   1 +
>  tools/testing/selftests/attestation/Makefile       |   9 +-
>  .../attestation/cca_guest_attestation_test.c       | 517 +++++++++++++++++++++
>  3 files changed, 524 insertions(+), 3 deletions(-)

FWIW, I really want to have an attestation userspace project and there
is where stuff like this should end up living..

We haven't got to launching a github for it yet, but that's the plan
anyhow.

Jason
