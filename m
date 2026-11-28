Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827354;
	b=oIGYWCzCpP0sXsjN2ldb6+BpMaXWvBXg2okmsHwhaHpMqImIeBWgvGaIniBk6fF8IVss
	 xduFyEkBcAEuqOKESLP4OVL3y3kmLKU9OepELDycTEom0TqW7PLv4FJipmfC2b4ewI6br
	 aDZ+uWOnYGS6Dq5XMKkvnBflp4tk/YDn0Wiqbn3SIg9AFV5Kv4uGPN0JccFrKgDL+0JB+
	 ePkLwvDc5JTj0IbtL3Rr9ZO/r7dn6jp4UKE0QZxuvT24nn9rH/eas4lXajyVW0ovcjstq
	 z+tqzlYIVuceB6l0zpixVua1/dHLD8EeMf+2NOoK3dwOQwrMUYWLw6S/nJIq/6bGSig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M4YJXz2C1qqMpFfvawPlwYq2ZIDKs+0ke0HB93yAMqs=;
	b=2aRLm6bN5c9RoDzKErtUazW/a3mikYpb5eJAdLBnzK++vwFPkMZKCDLsWalWQhzpJWo3
	 RILp5PD3H76rYWUbTbDYNpZxnxikusiMva9p8JkvpkdwwFKaYizy84EKxvd6U89AU5/Dw
	 lvJS3EnFrPiz21dWmPjMxm93LVwd0W2eow9F4WjPUaH+NF/XFzqGDQ9vbvzwhVRuTRv/X
	 RnXXOOVlhGPt76pCkVdr7Tby6/fImiFLR7N3WmE7BJAWHI3QFU981m4Rqm/Yjp4Tq4mmw
	 vQKFsivIxZdNurCMd6ROREGOEW7kWSVd7VW2jt67RrH5G6Adw0T1VDgmhmmuum6TZZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egc5oRyU;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3A7606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC3A7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egc5oRyU
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso105798875e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795827352; x=1796432152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4YJXz2C1qqMpFfvawPlwYq2ZIDKs+0ke0HB93yAMqs=;
        b=egc5oRyUW6VFDIcdxYwZDeGVcRPdqVVcw0/9bUs8kD5ZsjJsFc0wc7Ij4lq+IUwayF
         w2XgNkLL/plAb0xjtXjWDmbgHsj8BbN8y5QH4zabvGdDwwb8xzCpvOiS/FFDQ1pAmNwA
         4uiU6YjDORB86waZuFacytNoIhdLmWlhX93TlunzFDHBxP1tk3JWqemA4JUyNxNFOtfh
         CKwdIz1EOzEmUqFvrYxqw/6yXUkip8rv4zUWrx4HDc3q++gCUskaW4sXZoxU4kXNS894
         nnM8O1l8kivUFX2WTqpxfjbMSvlGbzGIvqyGbP1cvEGn8taKbCLd436XionhZ+TbNkl7
         Tb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827352; x=1796432152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4YJXz2C1qqMpFfvawPlwYq2ZIDKs+0ke0HB93yAMqs=;
        b=ci0vWpWVqhmI4qCAuG3B2ChO1MwSedt9/DaK06/vzVz/YRm6RNZP/B3pzK6apkiDz9
         e4WA1XfTt2upgbyAQKIoNhpawP5CuMX+ujm9FahA34ySpyWRG01hRbizcENfZs0vwrau
         UFLlmEa1iUnX9BzIRmadLbPicrkfkEgiNcaNxNVq55X9rZMVIwPAEACSFABf8ccqpamg
         dG4IoN3UQ7C1mfis3qniyIin9GCdXMVqKGi0tWjGPBfIvmBNmapmGnYRpykaHuaSTdhB
         X3qv05nxsc5rtziAs03+GKb7v+oRGkXk/ya1KNPaoMB+AqNu7/XcpRVbsGi4hSc6ja9F
         n9Jg==
X-Forwarded-Encrypted: i=1; AL+hErG6WRGNJKDpBK/ZmoWocYYgexugJFUdpXOolmdfJy7feAIbt959AEWpKDkcT8W8WlvfZb5SSoebHIU5GIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/to3JxyPk1AASDyZ8/9FMd3ggExAvYYARAGdiSbeB33JQ5H4gr
	y27ljte3sFv2p4z+ddB4nzoUV/AcGb+8oeRR5zdST3MBekRwroV76OMB
X-Gm-Gg: AZFdTZdYuiHGeRUyIPB3rdOQXSzb7HvV7sw8iI7YRw4EdQtvhelMJNQYeNQsUoGUaow
	66CinPV0WJ5NtPpVI/ZT31o+c22P+Id89yMNWo4w/hpQ7rNk9Zq/HvudMMNPkE7i7fzXQWg/lNq
	r4QFtfELJFhoFq5m6fb/nMZ4u8rJgdFqRPv8xxIclg8RATYd31UVWdrUqjiw4w707JjUnkXsjTC
	JcIpzsvAXRfzZOt+9l8cya6dtDgIMcYN/Si0jDtR2xe/KcwhaK9IrBUlDf9pb3YEiGDYsBLDJTP
	v6Q0giXIubiXhClcfaPAx5mSzAeK09isRQZNg8oXfBmxDWNRbOCnPJnHUaZ+t8ZzyHxnajRjkLH
	FzdfM8q1kYMNQXBpxGtSgU/lbePI1AsizulZ7bSg5KCCsOSUMq42qtsAvnHH6xQNLXRnqRU+9i6
	XVtGneA0GefXmx3MoNX11D/kPY1wAZfdeN+LVDKHxvuuGoXOqmnRO6rp05MhUCnIyeoOpDG4XaV
	ALxVesQ6N6v1wP7uqQuW6GNB28uyk0qtue7GNEb4WbM2NwAUjwMl3pFaE8U5Hq8bNE+7/yr2qDE
	2q++gRhLKew429JcMXYJNIBhxg==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr541218935e9.32.1795827351797;
        Fri, 27 Nov 2026 16:55:51 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm1328407645e9.4.2026.11.27.16.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:55:51 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: jarkko@kernel.org
Cc: aleksa@amutable.com,
	alex@amutable.com,
	arnd@arndb.de,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	containers@lists.linux.dev,
	corbet@lwn.net,
	dhowells@redhat.com,
	ebiggers@kernel.org,
	giuseppe@scrivano.org,
	hughd@google.com,
	jack@suse.cz,
	jlayton@kernel.org,
	josef@toxicpanda.com,
	kees@kernel.org,
	kpsingh@kernel.org,
	lennart@poettering.net,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org,
	luto@amacapital.net,
	neal@gompa.dev,
	oleg@redhat.com,
	paul@paul-moore.com,
	ptikhomirov@virtuozzo.com,
	sergeh@kernel.org,
	skhan@linuxfoundation.org,
	viro@zeniv.linux.org.uk,
	zygmunt.krynicki@canonical.com
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
Date: Sat, 28 Nov 2026 03:55:41 +0300
Message-ID: <20261128005541.873229-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122193539.3334213-1-jarkko@kernel.org>
References: <20261122193539.3334213-1-jarkko@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jarkko Sakkinen <jarkko@kernel.org>:
> Work on this feature started in 2025 after reviewing David Howells'
> container object patch set [1], whose underlying mechanics made sense to

> [1] https://lore.kernel.org/all/155059610368.17079.2220554006494174417.stgit@warthog.procyon.org.uk/
> [2] https://lwn.net/Articles/1102593/

You put wrong link in "[1]". This is not Howells' container patchset. This
is Howells' fsopen/fsmount patchset.

Link "[2]" seems to be wrong, too. It is not something "earlier", this is
very recent LWN article.

> While the patch set is manually written, the original motivation came
> from isolating LLM agents

LLM agents are too strong for Linux containers. They should be isolated
using VMs or using some Linux reimplementation, such as gVisor.

Bacik said that he tested his patchset in Anthropic. But I think it
was tested not for agents themselves, but for something else.

Anyway, I suggest to drop this phrase from your cover letter and think
about some other use case.

-- 
Askar Safin
