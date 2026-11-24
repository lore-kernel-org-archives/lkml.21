Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478933;
	b=VBoCDHg7FTg++I13HYreq3MTpVDVdiIMEGK9VC7zC4RpXTc3PVE6QG5vU8Pin8Byod43
	 3Gx44/TtHBFzceyNg2hE4APVKU3JiwISKKBlz9bXmIZ5Ln5D9BctZp87h8ZW85A4DaZFW
	 VZqXbaGtYcJgoirhA1hm+IVkrMj1d++ee0D8AOfVxpn5ZLYx4oqhNOsxwz3sn67a9c6Wn
	 E0sd4s/0UiPQbszowJINfJFpWfIohGgligGMN8eBsy5wRlrLotbAXtb2/EQTYcfEYJaK/
	 gusWf2JKo4W//w9F6rP7g+YzlTKPPtu2aVFREjL9lHYwa4+Yl/x5WUuho8SPlpp/BtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478933;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RBWaWh++9bAgJ8l4GJpqYwLzmbbx9SikCJPmdYDpcA0=;
	b=BEbtxBrZS2n25HSwKNvsTr2Ouzj+m5Ko5J3qk8ynYoZINeTq3lkqw1ufplF11SclJbbG
	 0C/qKvuMF02eGEAu2P+FIYMXhpd+SyFd44LRzyQ1Hkf/uWq+slxBwEF5p6/OKkjXAc9W+
	 h2Wad7hdpNYp1L0d4kJWILYmkS7RzRLxFMLM6d+5vOudrMHyKBKB6QwE+0E2rydHenWEZ
	 7J74z2N/6K3NhiST8TCK45wnnUtHz9IS+ARrUNqCUFK/kZK0haE9KA+6b+mP+1anX2z/X
	 srL9Mgv6yw9GnCc3XZ9ZD4WV8GO+Fod3e8ZBEnnD4OdoHTPUM1cteMGKhfwBWnOyVCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6D0606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6D0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so25798157b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478931; x=1796083731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBWaWh++9bAgJ8l4GJpqYwLzmbbx9SikCJPmdYDpcA0=;
        b=PcS+ubwkOJqlYZom5H1BkNi3NcerzARooYxQdNfFUyQy+GqDjFEs7IDfUqJW3hZCY+
         2DiEyUCLiaBjMZzUJTIjjSxCgRpG6dGC0ChVM1YQRXpETWfh2odtd0cmgqhN/WnuOVMN
         Cg2b+3Sr9N54lRhZ7AlN1RnP3pSPwAtJBW1etQaMVXvYH6qC4w+k+VdlwihhCUJAbpjP
         kE5JrL3pbYolA+E25Z2LfaUHXNCoQ0KQub201tfAI3xlHlTbq5YrnjdU27JmPaU7I7JD
         nLyMagyJ0AYQHZ5ll4VyZ5aSKgyPLNJsE/8MiCWo+LJ9kleeM0cN8bVA11UQre6yp8i0
         66+Q==
X-Forwarded-Encrypted: i=1; AL+hErFpZH4wM0oMfNihdiAhlWQXHP4Dx3bc5pMp4yHZ26FHIxACkjUFOueLiXlZJLTyg3dhadyVJ5GfWtQdb1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nQCnuEVVdcYG7ewM7+6TCqkarCOHEj+WhafOKdI6//RfGwIr5
	ZQJJu3DF5DSSRAzRJn35vps/JZGJIqqs0TkjWKe8B5rvBI69wkvxZG5m
X-Gm-Gg: AZFdTZfl2BEZQMZxYX/PnzuqVHn18FdRaS2cYIGqTR/YQckePT5/0Aa5DxhkZ8SKRAW
	+CU4muh+Suh++smaewXdPY8KACEDW2zzqDCKSJt8CUwhENokGxHNPe6oH8CpYtnl9FJ163/MnW3
	prc5HgXRqwrKGApmDQ1/b1EynOyur6xd+1CiesmrFnx0Oo7jGRW+q2pn6dcRQf6hQF1ex5EWCjZ
	7K7IkmG5vc9tbfOc4kj+lYv1yTgHGWyCKu+8ZjwLvWw1AEGmb4JJS6/2NUlI80u5mEtMJZp8dii
	Qgr8itUyEQl2kAr+zCl6doSkRcmk3JeU/DH1fQrzyfbhzKfME/5Z582NELuVxOPyAIaCMEoXXcJ
	aGF2R2MM5C4Apn9UUk1psP1zaFbit7Tj2ab2BTZuPu1NP/UnWKPIamNRkhtFKxRETk3UcZwclX2
	i7FIJ8RuHHIHDEPNJ82VQFnP6EPQcgLcHkFIjBYb8j9WyRM6RQouFaqqh5ZDx39AWVoDn2WsYNd
	G3SZHbHLtgRITLM4HYNAcOa7wM7n7yKvDWD4Y7uCXCTRmVxneQFdgPWYJmfBiMIDyNx6ZthVGOX
	n2MplibVTxM96kd31HZC7PBT6rVqL72iXCtMmnfO3b5odAp0MJvmRIj3J2XQQDOWcv7JZ8wnT7G
	gJVG9g/PUZTuf/+lx9xsMyzAQWD3biNA=
X-Received: by 2002:a05:690c:370a:b0:8b0:cc24:f7b8 with SMTP id 00721157ae682-8b520524d43mr49786797b3.69.1795478931674;
        Mon, 23 Nov 2026 16:08:51 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202dd36dsm51470857b3.26.2026.11.23.16.08.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 16:08:51 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v7 6/6] net: dsa: b53: fix mirror destination and source state tracking
Date: Mon, 23 Nov 2026 19:08:49 -0500
Message-ID: <20261124000849.25327-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119190348.2317702-7-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com> <20261119190348.2317702-7-florian.fainelli@broadcom.com>
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

I tested this on a BCM53125 over SPI, with the series applied to v7.3.3,
using skip_sw matchall mirred rules and the switch MIB counters:

- ingress and egress mirroring to one port work, and stop when the
  rules are deleted
- a rule for a second destination is refused
- with two ingress filters on one source, deleting one keeps mirroring
  and deleting both stops it
- once all rules are gone, a different destination is accepted

Tested-by: Joseph Telaak <joseph@telaak.dev>
