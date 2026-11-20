Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207367;
	b=ZX9zpGwe14LBz4moEP/5cEN3YlBGfAA5q9uDlhW8o4ygIb9xYO9ndGnmDp1h+L+VphXA
	 Xfs7SG4UBiIMSAxmEG1qyVBAmcTQ/Hfn157FsYkWeVXGcM3Ov5Zf+7b0TqdfJQ1iQd8Yx
	 s+T6g29WOR4YcXHGxg4m6Znz+Uyh4JEhtGSvJO0Ltxt2iX9dTukxcH+6Ai8dvIGtle8FZ
	 SFzyS9VA42OooVuYJonrZ0xbXUjtgG42c6ARxf/2JJD5s04qycFkmi21MJOTEAJLDh4jh
	 OrzYfEMIxTIYobQdv8AOeSODlqOTCRvj2/4lUfYZJvEE4pIMQ0x2cZsFDfnwZ/7iWSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207367;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=pCml9rYMYB7fB2Zy79l25CZ2iG6ygatLQQpuCxucxW8=;
	b=ytWh9aM3QdRPX+vRDivWsI6+ooD2Gjx3HGOpCzloDHkrOeGkoSvzDoMz+9eoyKTACpdf
	 hWUzdGoziUp+ZXt2GncPu5HvggE63r0VJ0L2v4T1nPZ3RVvI4slZx8KWriYe0tlFVlAon
	 jj7Znve+efUkhAmlU+zVlx2tt+6esIawUuy7i3aGVmkKRuOBiMm0GpShQI/bdvrBzakiy
	 J+3/PPYsSqMlyoI2GW3JKmyiiXJ6OKTHJEui2T6T8NRHi9SEjbMjFuiHsb0OqXgGgdTcI
	 7k/l8b1vJR37MJ9CBxjcqy++l83sbVyaiYNdBivGnRBLZBUOzjvrj/7mZoEMgu+X65g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A0860A5BEA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A0860A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f2049ea7aso101758085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207365; x=1795812165;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCml9rYMYB7fB2Zy79l25CZ2iG6ygatLQQpuCxucxW8=;
        b=1XaIRS7dvcwoVJZGrABIqjO30hwRf4KBl6lalA02bLSmWIOYaz34vUlTCPwMQJNVn1
         6+uOcjBFf2/7WaulXnRJ8cg/PV74a9fT5TD2dGcEOs2T0WAWR/FjS2G3lCHCXXv2KAr/
         Wchmx8Ynl7L+YikcnPlEYQ9CnqxYQASHzjaO/2gMTB4jhji9bvXhUkLuI66m7zu1KfnW
         3KbGHgM3N4kPUcaMLLidk6bcO0BK8qLNntJgXLenk7IB+DS4qtOw78ksUpl7U/1GO9aY
         LeFmcUwQN/C4ptM9MDDup/oGzeXEEWmVI+ZW7aZRso9Kt5e7pKk1JdDUfbKoZYAXw2lB
         CF1w==
X-Forwarded-Encrypted: i=1; AL+hErHWiraz5IU0csV5fEoFhpjARgc7nvOBR2d6lmJeY0lKYnAFDR/2+WCckOYIKMZ0RSpEwvRNJPOLkUX2LSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B9jv2JE3Q5R3yFfRYZncbsi1oUcoerr6BVmwCOTOASGoMURNj
	dTnWVZW4E+KpTx8rCljcyP9RV/ChI5fDlFo9gN1sImF/ilIuvn/pW/CD
X-Gm-Gg: AYBFou1VNapRDDSaBeuBeK6MQKtePS8OsthiqeXT2jP1RdDb3w69EYtNGhxNJyeW9Fh
	umWbHwQLCSBWTyB7a/mZ4VVLR15T1jlDRE2DwIMnVBYNnuss7MfyjDTVFVNDd3JdX596bnQzQgZ
	vMJGlCRI/8/nbby8qXCIJ0zWGQY1gYZ8aC2qA/eBM+YQahfUsn4QW8ndtjupH3gdPDHZOHZ8WIr
	AG4gtWU+UKrS7oQ8IPfd9yGz3qj/0yrqU1uAvb8ioM00ieR900SNvuYitzDGdwud2sH2Ovj59oV
	0txV2UvRMbORSqkHcuDHX6IemL5LchL2WYcnOnE1Igt8mnSpR1D7O83rHOIBCwlKXHQpMfkmeL1
	6fzrvFkSQgC71E6YA/QLaD/yQMp7YE/8Lp2p5T8XjPl7U3U3JlrKzMkT7EWM5EHsiTUnR6L4QOV
	Wpu060XUsHBvShMND6gHkacvRJMDoAZ/sRNsvhXqafy+C4GSjwVb73gS7uRC+XMML+bc37wg4tQ
	QGhlidKihEhM1wHAUlnonuxgm7NCeFARd0ZxWvS4SHPDzRwS6qKitTdjhr/Uova5lamN2V1/n7e
	+0yfnPyId2PenCICCz4ojnUDVKg9meZXFMHsPCqu6q7lYsDmLFlqWqOnTpA/hNBzLEslo/+HYRV
	lHxoHcs3FcQ5D4+O8bLilc7Hi+D+mQvGxbN7igiADtDCl7d47HPCW
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr780500985a.28.1795207364641;
        Fri, 20 Nov 2026 12:42:44 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0319fcsm277058185a.4.2026.11.20.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:44 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Andrea Righi <arighi@nvidia.com>, Xu Kuohai <xukuohai@huawei.com>,
 Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 2/8] libbpf: ringbuf: Prevent NULL callback crash
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711447.18576.11461006206277762922@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <130931685c8b2064325fc65a856ecd810c8a6b5c.camel@gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org> <ajVKM9tJskwg9OFa@krava> <130931685c8b2064325fc65a856ecd810c8a6b5c.camel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> ring_buffer__new() and ring_buffer__add() when callback is NULL or
> when overwrite map flag is present.

Iterator-only rings need construction with a NULL callback; v3 includes
that API. It preserves the merged consumption-time checks.

Overwrite registration remains unchanged. Both callback consumption and
the public iterator reject overwrite maps.
