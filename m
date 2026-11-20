Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217031;
	b=yxWoWgz7JVOxUEoy4LN80AxgL5iOpYCE6H4njWLHxqDlEkpmzkV1svNH2bM6YOLZQxIJ
	 E0cMeIeWA9u2Ec4SapOhLA/wQVI7ncQROh9pHS6ChqMzA9FZheHSC9d7dyuOmj/MoOrBI
	 7LTtKqUU3iIEE4rMqms2IH1KTccbOan0h858O7OEh5ZhzFxSIlBcy8cfoD4regL7qqNGN
	 Q58r4d0tcbCg2aS4EtS1DLgd6e+OH8Ka1wvvDIehhwGBvLgFM4tp6L/2FW0R6AIlhV49e
	 Gt+zaW707l+Bt2mWvBx9YkzG+6Fid6shIfQwHr0gLBNBGe5fVmPGRtROX9hT2FLqQzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217031;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=yBWwAFCqhl1MWyd1pGrfSRfgr3arX7wZtYBN4Lqn+rU=;
	b=UgG5G3O4afsw9OdIdpGGhriMVdG39Rz7LJXoCZ6v9PeHAfnCVp+EeQQrn+QAno8oOu2w
	 Bn/iAwZjJdepfHbwCS8kWRntdceN3eo2DBjj+PnmR16ACQSu2xen6f84R0J/h0WaOLx3C
	 fvWnMTygfhwJDCpD26s/o5CIHYzkPiiSqFzp0HPry2awePrKexXKdaG9UVbFIKU35bnjd
	 fBDl42biTv82Bpr3iZclUc23N33leHcAKTW6H2Piyg9R8POY0q/NctDrfd8b+YcTa1cp7
	 TMg7gP0yNwxzOl4vjhkb+LVs53lm3NgY6B80HiANYCapjzRqQXY1KN3v2Thy1XNod9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFC5606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FFC5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9495d543c42so145828885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217030; x=1795821830;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBWwAFCqhl1MWyd1pGrfSRfgr3arX7wZtYBN4Lqn+rU=;
        b=H6KAaap8IeSCWwwbN4UWYCwE0UbQjGPOoNBZDNsaK0WmnXM04wXSmI6iDTTf9ZVHWw
         14ala6fdB433h3qAXxjWya32svJ9JjvOO0NgkD3/FCYVs6UE7dJBFkMLFLYa+lmGZo0v
         vhU5rmFd+JvehHgCnhHz+QbD16BjjfytFCsx2ldScdWX5Zg0LKP4XnD77W2eT1qTTv7c
         UCWSnwyHgJ8YI5YSmY/Uj/pvPjI3PLQcMICoz9RLdl8Fat/wTeK4Hs6c1u9miROjpi08
         9yN7/8TwE8N/iaRln3qfO0Nn9KCY0a/xxKxnHZJSiNvxNPGerGuTiSmnOwPTwZKWMFXC
         EZ1w==
X-Forwarded-Encrypted: i=1; AL+hErH8ysEEVGNoq9f+hxg4eCr9IY5+t9WjehnuqWWsPsa8HvRuH99y5XNpSNnoL41U6t+qg+lKYrVfdoUfOi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fkdNGDu/w29JzZVaLFbcOghJX51OXdKDYlcOwaV3Y9HUqukdZ
	mxgXiA0X44EQZnq6URPal9nhCaiFPdnRLVcoqDK2+mCeW23y4Q3ktZ4K
X-Gm-Gg: AYBFou24dGUixk25oQjqwSD5hvrKEb89NbArL2TL2EEUiwrNHcvS6xkGoyNu+ImeD8R
	jkQIoh8kKFbz6cv0f1i9+zXpjwQrXreEKnV+pwg4KKb5IYCmw6E0LOwzvJNWRT64FbDS7sclmw1
	bRf2t0NR1p8FgYcTgG/W1B2uzDlGf+dWNYGU/aa5dbOfLAHg+KBMuxwe92VNYTCXmXmtPskAQ6M
	6xcH98aU8I6JCR6bBrFL8UomZe3AIexufsOwRYZNeFHaY33/XO69XRrgLFB5VzRCP6/TadYalTC
	KnDzUoCILdrXRdnvcv002ZwM/PvIskKoTijA+9Rt7ASbdTMI2gqHSH5Nu9deqGi+mp9FfZf68zk
	MtGFO9wk+sPxX4124oxQPxCVrpcJ7k4DEw8KM+kKBkiYv+Lt2d7c21J1qzndv2A9ydzOUC0u9wx
	Er/1InenD6Ep6xMS3qseortGNQcoN0v+31Qy7TSwxHdSHogqBmRTZYuZsY5Nr/dbOfNGSPvh/MJ
	il9H4U74A22VbQnHxSqEI7Foufn2sRQIpvXui0RImK9HD0SJw4m7HP/F2QDXeDNPUE8/qlMFy+z
	8CcMhXP7oVNTLNknaIIP2yG8Q6+qHhIqLAqvUlZjFqipjpphpa/QFLYz2YYVbDAi6v4HtLd0zX6
	dHuFXh77A2esRWEAXU//+ysNr83j+dbs6/cjRqZmiXOmAdFWTauUJ
X-Received: by 2002:a05:620a:46a3:b0:949:7069:3fab with SMTP id af79cd13be357-949bab3e9aemr842214185a.83.1795217030196;
        Fri, 20 Nov 2026 15:23:50 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac1esm304475985a.15.2026.11.20.15.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:23:49 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, arighi@nvidia.com, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com, martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH bpf-next v3 4/8] libbpf: ringbuf: Add a caller-owned iterator
Date: Fri, 20 Nov 2026 17:38:22 -0500
Message-ID: <179521430208.33161.12109136474224844730@kernel.org>
In-Reply-To: <879cbd5d4fae85a5ccdb53e5e89ec64f6039e1017b62e548daecbee9bc05e900@mail.kernel.org>
References: <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org> <879cbd5d4fae85a5ccdb53e5e89ec64f6039e1017b62e548daecbee9bc05e900@mail.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> Should these three names follow the libbpf naming convention for object
> methods?

Renamed to ring_buffer_iter__new(), __next(), and __destroy() in v4.
