Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217034;
	b=iSZa6hHOXM/S7Z0kS1alrz92p55ygZF/LGjF6FW2+YOk4intobTbGqUpVKYPHKt44/ou
	 xLhIT7O0Q3RZpFWlHEJBFE3+/vz03aM2hKD6/GsWRhApXysGOcXsb5LIAgCv6jABfGI4Z
	 fi4nwG43zCRMrsXfpU6i1tSdWJlyb63umAxjmlMCkFJRP1b+wWTol2y4eXO8nyaDJF5tH
	 SGZO++mO+//hhfuLhp0XyjlzsRnpQW6WyHXuVX7Y75X5VPF/VYEJSF5Feaiiz0N6v8HEo
	 LkU4vlYUCf9zyfoSkty+xeAPCW92IEMHo9FkaiRq2KQrE5Sfi43tk7CKYYJwfiPUKCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217034;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QsMsrSVzccV/M4rLUJzb8bjMzW9z/0kzllqgzjAO/iM=;
	b=yBZdgykcBDKi1cS8CDJlKIHEZBave56fHpkNnjE1p7j3zGCcmXc6kyCyEjn1qurPSSmh
	 jouRXBULdciJlpFxHbRu9XWOlnCz0qGzOEdWz+DFjvC2Tx/vaqYfVwfCWVZKNYUIQIusS
	 Y4m7ciJFbt8morn+A1ZVfkQZszmkzhrSLXoHfQGYL8UQCWbyRjrf34SwrIpFST2xZIeka
	 kRWr+7MLPcYsJqkNe7lHhgal85NtUSu8jnPwoXdgKNiacXa/SytKdoTpbqtyATdt8rlxl
	 n8xG8tQiMCBsqDONv3Ep7uOoW4PEdleImXd6NiyipgzlRFh4I84V3t7aRfVgpYjhbBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406A9606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406A9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9210f2622ccso17715046d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217033; x=1795821833;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsMsrSVzccV/M4rLUJzb8bjMzW9z/0kzllqgzjAO/iM=;
        b=tmeQMmUbhW3dpMbUsvC70OYATwbBGqRQkADhfp66jnNsCJkflxfb5FjYZh3VCoejBK
         DQTlbu/5LORqNOt1kQcXBqrFWCdG8HxoIYsLBJFi/58bJFyS8pZdFz4Q2IDO0GyQ7gvk
         cYUJGvKIFbTxU7E5O24yo5MQ2kaePu04dTZsRX/KmxWtf+f8YsNjnd8BgE2x1+gtJiQG
         qNbEnaJBwJtvRsm4UUkKRgAGJpyYlbtQGBlP5xKYC6ybvu6+NKDUvVaUX3SFzzZk8A75
         yERVJfNkKWGy+AWmnIv7HyGBA8ESkNKzHkoP5POrGTbIHHx/HcUmXsxrgkSQvF11d6nZ
         Wp3Q==
X-Forwarded-Encrypted: i=1; AL+hErHcAyy6pI931BrCyTGDS8IUIPsfHxHIRn5N5Eqc5uv97uYyCnERainVzk9WOhQr/ms515/29kS//JBNrZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ue8VAFOLml44OKCAzF/n/5Zuepq94Jj7utJ/XSdJf48TPMnh6
	sAGz1Pp6SF+DHzv+D+DYJtPGTluuy+Sw1O7jThwQ/qNeFfVyxZpP70JV
X-Gm-Gg: AZFdTZdK8agW7kZjrzNvbYiyE3+89QuG0dR8G03hm0OcYN2CMWQCBYMPCOvtg0gIS+m
	XE32jGwmtpQ7gZ01ukP901kjFLf0J8EOOl3vqnj1GeRSQx2KoXAEIw6FPVTWI4CxvznzJdGe+25
	BJ78CuQPZJJbv0YuiFtup4yYQ00OUUef2bkCv5thabEVh2UfoNnPHHdHMLT0bQ7G7XbnsmnPbND
	UzhanBkcM+294FqKj3bTm9WpdJkPlVQSeTEnhG0Jk8JGW8iebcJJzdX1g2aBAA1Q+xKZ4a1wM91
	V5h4Pn1AAoxmbJDYPFl9C+oYvHcRM1n9lRi7m965UDUT2GafyWBFHGd6HCa1t4wZf7CN0etPcNo
	JJSKo4zC+Zn21OWnEvn2/MNq7hrdImIdr7GCZcl5z33XC6mYMVdG1kEQGyFXGUx1kVXmsZ4oDx5
	uc5C1EYT8NyPuB5IxpvHWeCBtVXAZ3piM5YIBJEF/GvmHtD+co5H9oUwoZyVcyl0iPrFgy/8YAR
	6zRJy05QHWscR0dzqy01IkWoJTQweErMwcsjp1V7zWQ+m9uYziy6I3pQ0hHfLQUQL5Rt54WqiJa
	IpHXFjmYtqbnQ+6gPQH+wEUe9nf5fxy8iiQbJ5DsHmAUMM0gzzYjZAUbV11SVgth02KowZEmiAu
	efsRu6jnvWKk3CglApyB/oIJBrRRaGTMK97h27SITUoOvTGSSTv4wR7tsCJuCoh0z91nNt1w5BC
	g=
X-Received: by 2002:a05:6214:498c:b0:921:3f58:a52a with SMTP id 6a1803df08f44-9213f58a5e2mr40412176d6.10.1795217033088;
        Fri, 20 Nov 2026 15:23:53 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a2806dsm37455776d6.45.2026.11.20.15.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:23:52 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, arighi@nvidia.com, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com, martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH bpf-next v3 6/8] selftests/bpf: Refactor lifetimes and test wakeups
Date: Fri, 20 Nov 2026 17:38:22 -0500
Message-ID: <179521430209.33161.791368362708058227@kernel.org>
In-Reply-To: <7d0a57117d3a4bac7aab7808335393ef3328333d04b7f67d1aa2f492959e3ff0@mail.kernel.org>
References: <20261120-bpf-ringbuf-fixes-v3-6-ff7ca15d6c37@kernel.org> <7d0a57117d3a4bac7aab7808335393ef3328333d04b7f67d1aa2f492959e3ff0@mail.kernel.org>
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

> Could it say what problem the lifetime rework addresses,

Split in v4. The lifetime fix explains how an early return
could free the ring buffer while its polling thread was still running.

> [...]

> so the state is updated in one place?

Added try_join_thread() to update ownership after a successful try-join.
