Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795300927;
	b=GOS+/FpwQR49BTW5O+IpZiSSnvQ2FLiKSu9i3LDjguwbOVb6dPwJCVk3uMpJk/+P+4LO
	 RoMIFyC59Qphdwmfz/akegbrczSx4V7BjDeayRNhCBjylcTvAfyoUREFCarzTLmNkQynh
	 PUFTFMEU2jrEZJEAvsB4vTQ1BI9ESfmA2pUfzR9o/Da7Wsz/ps6F53DV8KO5Qb9uVR2bn
	 Gu5TnBHTKj4nQFVi7PLBjiKK7H6t1eJbTk/S2f1Q6sEN/QQbrt3Qckw7wQdRpCCmB8Bdx
	 XtFqZrGUpazbvF+ENbv5ItAg6U676zBfBLgI1gOFIxaMyJVDi/mWXPtftSfIHLZwImg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795300927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D2UwN6uj+eBii3DP4gkFy2CXb9ETeRwrQjxMZhSvZ98=;
	b=DKmN6cxOGGA0GviAG7I/RN5YqHoc0B1JgkL1ddfNWyhB7hVyOnG+Z+g/XIfkWKwQXFDr
	 XY6eyWZXRBzfuIfIboJtbqcGYS7MDCqgCW903NSuYclCGT5nzfnGgU4Ss8xxdQO8DNyZy
	 sJNXUvRNuGKz6qQhDyVXc4upzDMZHJEvhC0bUYVAOC2DnHTk7FVbzm/QsnWmMPf6oux+6
	 NyLD3iAAUtEmaCtzHzqzUA/Y9SsMnDLsdEvx94wd8oaH9iuaX0yia/1w0541tYzVdMlAL
	 8awjtc4O5NlALcTOjPyfMvnQCeVQ7kpbwRqX9UkLkOyFxFMbnAA8NW56yeMbDFeYwQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0axLW/PH";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73784606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73784606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0axLW/PH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4af52002471so2480385e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795300926; x=1795905726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2UwN6uj+eBii3DP4gkFy2CXb9ETeRwrQjxMZhSvZ98=;
        b=0axLW/PHnotmGnAGvriUDC4zPVypUAFY7tABZ8TS4udy4Rp3gesnKf544GmlWlkSvq
         Dz0WU94DJEvJZAHvyDnh/FwYRdIQnMhzUYH5xXDSX7Et035M7FWb6nSBqjZ/YmeBBAWw
         LWlHWZKotM24upMg5sRrNLLpTrOg6pZDIFOE8DO9mnyDYjhKI8wUJzqiQlVRK7/2sgqE
         FhtsFRgAtArM/jmmbb0bhrs0U9kRRYzs0uHpInCW7Vjjw+kmF/iXFo/huHD1Y08DCSrB
         GAeijSHYKnDzfR6CRpF7UJFF0EGuufD7ohLNuTq6xWtMqsf2EeShpUbuZqfSMaq4wJHX
         b4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795300926; x=1795905726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2UwN6uj+eBii3DP4gkFy2CXb9ETeRwrQjxMZhSvZ98=;
        b=w+J5bpFgri17xPGjZ2mICiUR/CXED8HLI52jVMKM/pkuKVG70ix5EmAMWsiDRNK+cD
         0g8iwo7OKDhpGH/ueqx3XNLBsKIVhCK+pwIontpR0WBN1sppX+cA/5U2ADL7L5oQz/5a
         tIhaepFMqI6PnJaa9UjOVrN6ZmrMshUtVdTH22SFgLNlx+1uw2uOxBOOYLsTn+Pubu8j
         1gdmIDcbn7rh/upoOKWkpcC/x5ayvtlwa2Td5roVYtlQE2Yo+8FNFRiME40pwLoNzcUH
         oaM75eUWDt2w8QfoDnpRaPhXk1nUX0Er7rFaiXZTrNuIMKhrC4LxsrlD6vl8REh3UTKn
         xaNA==
X-Forwarded-Encrypted: i=1; AL+hErE6LjEUqTbgLlLKhaW1BpJg37kUL6UbOjlZ/deEQ8qS9oiVKvsEBCDnaApWDzrDhbsZcBFer5uV44UhJQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D4tdWQFRt9E/sZepqtv6R74n2YGtpH3S4wyV5emOSVDJlY0RD
	MATOFRuHHYH50ve4TD5vfnnSeYd4W4iAt8G/TmogoOBhr/4Q5Mb+7uIX
X-Gm-Gg: AZFdTZdItqCRNp4SNxEMFvU/HVMkeQzSCJM12JPlP6G3YFjjvxZR9MIFfTHW38PspHp
	SRMjmeAPJjSXk8HDzHGGvi6yFa0C5yMrfs6MN4GnYM3cgXD4WpqjdPnrznE5nwq52R2ojS6oCax
	w1TSYC7s0Wkzd/ThoY2dziMO5c54lXRTNwHxW9ISxzTQBX2hRYRJnpqifCybIs/Hp6oqK9iqk26
	J5JeUg8y5Ku2WtNy3rq/DhpSAbBKDweqlUlhQaslFaLYhnANWWgCshEpzbfO0KhenV/dUusCTej
	xT3tGM6xu3wPpnQuBSODppm+ykBexIFqra0FWlu4P3rCDLIbnqIaxO1j4JLE366bDM9QLuA+G1C
	q/ZCIQU6pkYQknVpDXrkUcgj/1IdC//nMf/xsaxNBnW/TqMFkjDbilUYnRFkomhhRQbAHmZkLfl
	AMcqyW+JlNMyFK4HZ8S6N7/0oK2wXztvpOiAHBAyPkffESOgHhJCS1megeJ59lEsED5w9+d8neV
	zm2/XKy1OjAEGD3yzoAAnsqKVANgebhnRBVxawGIUuzJiNhfcIgMxsDno6KfKjPMBUK9msqULrE
	OquQdnJEZSI8hWTosZ4loiOOKl0RzR2drrbqP7hTE/xcJ1N1qYJv9rjVpCXB9zjLd1LpdQ==
X-Received: by 2002:a05:600c:154c:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4bb887f43d8mr151053725e9.1.1795300925668;
        Sat, 21 Nov 2026 14:42:05 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm56649275e9.4.2026.11.21.14.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 14:42:05 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	emmaonana18@gmail.com,
	hawk@kernel.org,
	horms@kernel.org,
	john.fastabend@gmail.com,
	kernel-team@cloudflare.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net v4 0/3] selftests: net: veth: propagate check failures to exit status
Date: Sat, 21 Nov 2026 23:41:05 +0100
Message-ID: <20261121224105.6288-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119012940.32838-1-tianyi@cloudflare.com>
References: <20261119012940.32838-1-tianyi@cloudflare.com>
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

On Thu, 19 Nov 2026 01:29:40 +0000 Tianyi Gao wrote:
> 1. Patch 3 lost its subject prefix. It went out as "[PATCH]
>    selftests: net: veth: derive invalid-tx test value from kernel
>    max", so patchwork put it in a series of its own [1].
>
> 2. Patch 3 should come first. Patch 1 makes a chk_channels()
>    failure fail the script, and from then on the nproc + 1 check
>    can fail on a correct kernel. With the fix first, no commit in
>    the series reports a false failure.
>
> 3. v4 was posted as a reply to my review of v3. A new version
>    should start a new thread, and its change log should link the
>    previous postings [2].

Thank you for the thorough review, I appreciate it. All
three are addressed in v5:
https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/

