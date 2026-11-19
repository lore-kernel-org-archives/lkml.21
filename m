Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057179;
	b=42L9jM0GnCfMzQ65lj/+ufuU1KOoH26+6XzqG8CEh4WmJFFRVY818ocRMq+yWiVxqCYr
	 SRxpMUKh1juDKvv1r5bWB3vrZam+x3VjFSJObM9fNZRIRYTEoI8xS6cnQYCXFfXqe6Vok
	 +Sxz730Gut4kojhKI1rtPesCVKNyNYPu8LCSTwBWGvClA3CTMW7NQ89J+b8euOOCuEDVr
	 ZvBp4MlQGrdayblSzUCPuRNvtIWk1Lx7eDo6qZHrEpyOBi8XfITD2ff+xtuXkjMgc0xk/
	 tDGFRjnzH5f87uv8/+L5c17xpCD9TrAdP14/4Ps259OA+wow7fWm8ltwHoXpTBln0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=dgQEKlX4UyM3qEC+os6mGzDTqTu5S6FmfBmuaPR6ojg=;
	b=Rr6mF8OzQrWmq88jGeha/57qnxyTbJS2jfOqgoxJrukgvQ79qiT66dX42+Mu1U/gBNdR
	 FVVNoyWCBdq5AaAUC5EZmVKmbRSGvjXkC+TfKtbT1o3HTo597/m8aQZ0l5e0vPSGQHhUZ
	 8twMQiArJqIDDpPolTDRnzzic9lfvDB9cqV4bQyc2VNvoB/aSoA448XqldQ+MxajTt0nH
	 HmZTZVRLU0QRYjQXJOhCoz2xv09rinC7qN1Nb/jDRaUT5Axo90VVXEVsC75haU/NIOpEB
	 5NKpD/CHdd9193ejDDD0aVkgdXMb9hB/QKKiwwbF0w22J1ytdXjG8oemuB/6x+h8pzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gaLeZB99;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC2606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CC2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gaLeZB99
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2268252c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795057178; x=1795661978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dgQEKlX4UyM3qEC+os6mGzDTqTu5S6FmfBmuaPR6ojg=;
        b=gaLeZB99giyKcvhBt0k9cGoxWUHh1ZYVJXsKKk5OLI8ITYP92W3pTQX8L5cxeNLvRV
         ZTVxEEF0zm3xoo5FkOe/niY8F+R5A341r9P0nQdwJEY9hNWyDFwDCKeazH91syjnsBt6
         RN+KAYB1nw4xqzQtZE9VyjOlTtCPXXw0bzf2yUuyRjWbjwK2gRvEHcHu7xSm0autt55q
         OQjTlgGCsWv+NYGTom1YkW8pRdu0rSPgwAoERtpqlEieNZxsoj4Aobu/dj2ojRbFnQBc
         C3ARvW1gsIalg7ZcxKR7vW8QHcL9IHH2SJL8TYA0DYJ/GBCR5HA3pZIBEyyST8EBmQQU
         k+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057178; x=1795661978;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgQEKlX4UyM3qEC+os6mGzDTqTu5S6FmfBmuaPR6ojg=;
        b=JupoIP49vwGzvHHWAEDqMEl8/thFcu0WtNhj/uIwIjaoeUC6Zd7A8c66wu4q/EADCN
         k1glI/3C+oAPuVx7jr6f9QjFxyzT5wF+l6NAdhIyZ3vqFZwh9oNEm7d+f+0hh5QHlmqC
         iz5YlDmNA1fkfFOByAiNLgWvPKLHBiW4aL2imiLNBTfTmKwmzDq5k5ixmvnXH+FvYGWq
         WY6XnhhuO646YldiAGRpbSfQkAIDIKKmSldY4ydwIwELp7XMNyhXxB3vqEyE08Nf7xPW
         eqDDJmQNiR2GHOG2kU3owgEFfCSEBj5LslDUTssxHcda3eR4dRqapAISGqxTkszA3+4Z
         oYNw==
X-Forwarded-Encrypted: i=1; AL+hErGjqOu6nr3kkyLBpnNjxqiPyaKi+Z/TKFtBUi8aHzCFX0G8uVGCjUMB+6u7JSsvUTqr6gYW+J7Qml+SfUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+stRSqP1RpRJ72dHTsRJ57mD9L0NFbeuPE+LgYIYF6b6VfD1S9
	dn+/vyYQ3Pi/pJzn+hbhpLWiYVMWDyp/yHP4EwRZ9qq5dmyLqt+Q1GBeT+IYSk3X99o=
X-Gm-Gg: AZFdTZf+ZyrJ6SXnYCSDkqkE2a26q7lTRmq5RO/crM3SjtZYv9ZkNnqbg9fkAOmdpCG
	GoXM+OzNJLb1/71q85ihBuVgHHfaXJKGJd+6fXFkot9JAu6uIcsgPp6i9Ws13l/cJ0PDq+1k2mU
	JFLqs3yiodQrY/YXHxbeAsy/xCiXKvrpwiWfyVbvMH0Jey6571w5xmrVFQa+SNs7iLqYHnXdRtb
	oBmSdbOC1vktTwenCE7QfIqo61VdlZ7VxRkTLmPlTOXcXca4yjoRb2dWQ326osIZko0bmAfpyMG
	xIFpuwvW7n2biCEdLgTqj19urpzm18JiPRnTmrJBvmI0S5YybBnTMJxOOwca985xiIDZWu2gcz6
	HsnhhzPsnH/nGZ2CFUQaepjL33+W/ICjJVK54opSKf4wrKmq7k6NxWQu253SiR75fAS/0FnIw92
	jrNb3/P4CCA4d2okY5KSfkpjCNChYglk0fpYcxk1A8cXnzsoSxKfwucz6GXiIAiZ5/4SpP9Gh5R
	rAmgYef5xpcI9cffXF6hD9FK0lpjT6gZesFhlXvxZX0MTv7S02PcVfMfHMUfG0IeIXCQyaITDBb
	LUL86rK7H7+csoGfNcN9nYVYpW8=
X-Received: by 2002:a05:7301:da01:b0:378:1191:43ca with SMTP id 5a478bee46e88-38280a386edmr3952911eec.18.1795057178100;
        Wed, 18 Nov 2026 18:59:38 -0800 (PST)
Received: from localhost ([23.145.140.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm11890072eec.21.2026.11.18.18.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 18:59:37 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 18:59:36 -0800
Message-Id: <DMYUNULEK2SL.3XF7JGBDKUWR@nexthop.ai>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Frank Rowand"
 <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Shawn
 Guo" <shawnguo@kernel.org>, "Grant Likely" <grant.likely@secretlab.ca>,
 "Grant Likely" <grant.likely@linaro.org>, "Pantelis Antoniou"
 <pantelis.antoniou@konsulko.com>, "David Daney" <david.daney@cavium.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 1/6] of/overlay: look up absolute target-paths
 absolutely
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>
In-Reply-To: <20261118155103.GA2141649-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai> <20261014-nh-of-alias-overlay-v8-1-0f74f05ac762@nexthop.ai> <20261118155103.GA2141649-robh@kernel.org>
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

On Wed, Nov 18, 2026 at 09:51:03AM -0600, Rob Herring wrote:
> The current behavior seems correct to me. The overlay should not modify
> anything above target_base. Correct or not, couldn't someone be relying
> on current behavior?

Out of tree, yes. In tree, lan966x_pci is the only caller that passes a
base, and it only uses an empty target-path.

This patch exists only for /aliases, so whether it is needed at all
depends on whether you want aliases from overlays in some form. The
case is a driver applying an overlay with its own device node as the
base:

	fragment@0 {
		target-path = "";
		__overlay__ {
			m0: i2c@1000 { ... };
		};
	};

	fragment@1 {
		target-path = "/aliases";
		__overlay__ {
			i2c16 = &m0;
		};
	};

Today fragment@1 resolves to <base>/aliases, which doesn't exist, and
the apply fails. The options I have looked at:

1) This patch: a non-empty target-path is absolute. It changes the
   behavior for existing users, as you point out.

2) Leave target-path alone and handle a top-level "aliases" node in
   the overlay the way "__symbols__" is handled, which already goes to
   the live /__symbols__ regardless of the base:

	fragment@0 { ... };

	aliases {
		i2c16 = &m0;
	};

   Such a node is ignored today, so nothing existing changes.

3) Apply with a NULL base. The overlay then has to hard-code the path
   of the PCI device node, which depends on the slot.

I'd lean towards 2 and drop this patch, but I'd rather follow your
lead here. Which direction, if any, would you accept?

> If we are going to improve this, it should also define what NULL
> @target_base means.

Will do, if the kernel-doc change stays.

Thanks for applying 2/6.

Abdurrahman
