Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795647443;
	b=u4izhYG/4fGXgzjBaJ90dNcptd/LXWp8tiAKaPdr6rx0Jct9BmhxdpVl5C9moWupWon7
	 zAq6nITtKCxkil6bGzTsoL2t1oKfOArM8pdVIQp7asRiV4Zf93xxtLTaiu9Q8FIrCWkcB
	 mhL9Rpo9aoX9kucoHB09OH/5AtbGg5DUJkacr+t7Twp0+0TcuOyMnDI83ysCJIaBDHJe8
	 0x7mXhPB3Or1nXQCwEXzM+gSHiT61Aq/VWIsQ2HOPbs9/K97aHFDrulr63ArnUxcvmDqT
	 1P01UoPiA2QqYxBbMPOtrWnBZFyQe4lX+q0O0xzcEWjUwKAqoOgPbIr4HPtuV7zOCXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0OVfCBvpQu7+LPEH8zPzzFoXUbPUS8d7sUdmZNjwHnQ=;
	b=5qRsVEnFQHK1EFJUAEMbMOwij2AynqXTdQat0XNG4DWfEC67+FcGv+xEFqklOjErIrJL
	 rgoVp5GaX/rRizW1XEnZEsV1VHKNgDdaXwH+0mgrIc2FMVRuUIgvb4fZmdsa/LRT7kdrU
	 Cf4hulLdjBXjUtrzl5LdcYpd2Wo/7bcFrTQtx/AEE0ZPNeZerDsNRakMBPnOhmGPpds1l
	 opaAFp4HxvZpE0AKmdBsTAl71FASaS6Vi0TaZxv9Vx6NTPiPnOim2iXX7EE9fOlxkCBT6
	 HKIarA/E9jOot1RFV00bVrZRXYfjD40wHiH1EmzuDMKesvdbGArO+MnBZF1JUbGzFjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="nHe3H/56";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE76606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE76606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nHe3H/56
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99b49d6a5caso1919531241.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:57:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795647442; cv=none;
        d=google.com; s=arc-20260327;
        b=gR8hoQCjRGOlf5VQea42xnwUR+ejnMRIHbsopxH+dyKWkdK73qlvHGs3xUgIbBr+o8
         dZtH1YNjmUbCsLbw0e9G2HKJv9fc7ZOBE5hz84YnpgnzTC6MMLUrm5/h8zV8vHQs+8Jd
         sboGZfG7ElyqG527ArUSom0K3VWf0NbiIBn8lT1USV38aNwdryGQn9w5DO9QtByetMLD
         njawHpmnnE/EWCxLz44TxL9iUqPxmt1kTUOIcXMblR+nGoEhVKQ3H3sM06LgEZDPQSon
         P+IV3RRPQXy8ynUDdbfzT/XWNXJR22o+l6dU3D94d0wrs0KVUcMwyJukkggRcZ3UhSCL
         CGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0OVfCBvpQu7+LPEH8zPzzFoXUbPUS8d7sUdmZNjwHnQ=;
        fh=MnFCHLmcNaTqMqySvcUd7Qo1SgBjb4lAtVjFMQbyPJg=;
        b=HOu18WUrWDlal5kb8gSJk32urnZwh4ur5hHm5UhmjpNbT3HkrWOXWrHk86c66fKw1F
         dlCNN0ULitJxsBvvb0+1puN+K2GmqsPn5KWCZZi9ZFSJ9LxlZYohsaHQwOO3Wg7JfrFT
         m7LNSNp5Y/JfVzJgL53dCMsBnkFa6HUs3vhwXp7vV6cXFn0UVnyfifkAbfc5itn3/r4/
         CZUPREw7Fut3bzQ+arSK21ddna4vzkOCQzuXLwt5W8Fry+83gmTppGLgqYRKD8vDIa/p
         +jZ7rlIgA0O+WSovXBJXC+xwyxucx9HYOESuMpu84wr4axXrUiC0ASZXpfgwRSSt0Syd
         qrpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795647442; x=1796252242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0OVfCBvpQu7+LPEH8zPzzFoXUbPUS8d7sUdmZNjwHnQ=;
        b=nHe3H/56gYMAG2okdtmv75OqKtAMkMLLg96S+izNEVUtVBHdDeHgKoti8AsSWEEVp4
         LTSnXa19xyQiyZDO3m4Y4+gS4pHueod/kpq1qXnffEqG6KPe/OwF4hZVKTVJ9OAOSxb1
         NR7EM9NdgUhA5dTiQCs4Ooor1QKiJG+Kb4ax6DXvgLb6RntNiulCqojAaNQNDoP1ViBt
         kYQ35y2k2oor3+0bdQpC1maCyPf45A3fBByWfirz+ifjXwOxGeG0TRfz2GWJfhIBWYJ1
         xY8MZhmt7y2t/wN1xDUQX+jl1P6PWMQUQVTUwhbn8XbqZtzdRLA6ehWfu9ju6+ej4Kwe
         F1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647442; x=1796252242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OVfCBvpQu7+LPEH8zPzzFoXUbPUS8d7sUdmZNjwHnQ=;
        b=qjc9BoUh1MY1pakvRVMozUOEm8Sh4SQROiZ63ysNOVZ9MbQINmX1o4NfGkpxXqOBXE
         RioU8zsoHaSNLA0LumTRhs3RD5//JmLFcYI4m5DGqwXaznKHQ1CSGHuPIayyzW0EQmMY
         MITTRV6lM5JPhGDKYqJ4jn5ryW1N6YUUwCwkgNlSXNyGzll8AdXVdmICgtfQWH8O8bPL
         ssHMZ3ieboIe5GSYDWx+4P+2It4cZn+G3vVhGcc+vGyZ5DUhTpQyz9/S7nBpLlhqTNZk
         ExedY8rUFfapxbP7LDrNODSiBBCB8beLI2KuTdf2bTVr067HwR2dfVJ9mAaUeRzklw2k
         s1bQ==
X-Forwarded-Encrypted: i=1; AL+hErGtDqXtbK+yg2zTJBmjalcXWbR+i3B7SGJUQits6y8EkwhqN10Rt0yGjJWuUJbFQlHf4XQfAi1dWOSQs0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QqZ4udj4e0qZnhIFIxEl/WZtQJchHuFstxHUff8LmEZ5C42v7
	Zt4r+e+4dT8wKzy+WHHadg5L2rSCPemZ3lIk8xk3MdeQgJxna9MbYm3Y26OUAo+8MNu6ALlD/sD
	WP9mW2C0pZK4o0lij0jKX8X1uTOLOx7x25OPZCokz
X-Gm-Gg: AZFdTZcDw1ysO7YR0CWXUk3v9fL0iQIQSASxtuOthhxsI/ieKOd0DjNVXBT2IMVpffA
	oZn/8hVppAlhVy4DxsywtGsjEukIeJW9XXjp4btQBUTYfrfGfIgDzxgQTXGRCcVkfV/OehIdhEP
	77L3k1X9M69+TjLZlEy1hnRsyGLd48a1fzyjQfEnK7rD+hyGl4nVp112evndwha94/E3gT0uppk
	WJXkHHiTlB4Th3L6usT6JqZQ64okAU+2s7UO52nhQWvP5t3sPu9zW429nVJwQOz5J08JIJf0RoN
	oI398gBEIEjS1u4VCWhHIDtayGAhP+wYCGzrvQjxeoRMddgqW3PmOKPl7fvS719R3FvzMQhqg8x
	rzLwg/G66/xj2LfdiX/aXLQjiIRzS9XQViYwSJJ/YUDbrfNX4L7DVGa87Sp/47ReohFfy
X-Received: by 2002:a05:6102:3713:b0:7ce:645a:13a4 with SMTP id
 ada2fe7eead31-7d7395a933amr10370821137.20.1795647441313; Wed, 25 Nov 2026
 14:57:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125221911.1425213-1-elkin@google.com> <6afabd96-1888-43d2-9ccb-73ca6702a004@kernel.org>
In-Reply-To: <6afabd96-1888-43d2-9ccb-73ca6702a004@kernel.org>
From: Elkin Cruz <elkin@google.com>
Date: Wed, 25 Nov 2026 14:57:09 -0800
X-Gm-Features: Aa3M54po9M19B4zck65Q5x7Gi_mcnDA_E4XC-TXXXd7r8mQrZUfrKezEY8XNZ0k
Message-ID: <CAC_6YktVNFdtDLsNHgPEy-8_2YfZ42mUsuXJ6OKkm=T7zFnxHg@mail.gmail.com>
Subject: Re: [PATCH] mm/huge_memory: check VMA end bounds in insert_pmd() and insert_pud()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:40=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:

> Which users in the tree trigger this?

Very fair point. After a quick check, there are indeed no users in the
tree that can trigger this.
Back to the whiteboard. The linter is still too noisy. I will hold off
sending any more patches :).

Please ignore/drop this patch.

Thank you so much for your very quick reply!
Elkin
