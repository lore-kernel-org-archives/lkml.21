Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992443;
	b=NaxulYSCr6ocpB4L95Ttk3PUFCox1WaTntco6l5eh2SJw5Usn1rOvNRzrQhSeheNuH99
	 GjkaYpbNA3IezxrLJWOuV4ZH+XUewtaghF2BSo+io1LYX9xAbbCMczcixG3ruIMFotJbq
	 TC870bREF+6SD0mcyRyDs8G7LMHB6xFfq4ZZ8iifqoRKt/uHtUxZ/CWzk6Od6jGm9ZLd3
	 38ZCzOGN7+o+07qxHhDKycPdyZgYrBcB0QqaJJf6xw0sFjExd8U8iUS9/+0KzuqHIANcv
	 WDinLZXgyG9/ccb+xOOEnLNrCrWHIYNNfsO2NoRakeqZTi4u2pH7CZOWxKHQiz0/NBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jqxyrzbxVSXD607utnRg/dtiDVgdF2PcAOp0S72RBFQ=;
	b=rPN+mfgglDedV0uWDEWx/eSrzVaX1Ml5yVsG31QOGv5FvBDaYfPV/j22U7BYCIMAHCC1
	 oIk1GBJfHXqpiZpCZJqBT4/EbZcYRkkvJCMAsTOJbz8We4e1lR9eqNcgjeKiSNc+PUs+E
	 2Icn4enNi5jJXodzuRQOHck6GJScPpvcwxUTspoL/ixiULlpQ43My6rS0uKQn03EV99PA
	 S4xMJL4kGWYhA+pcITqmZwxK3ubIyT4Vr42sd+gc7HNW5snDF0hyrukPcGlvIF5nQXVPk
	 Ke3LgtWOTFpmCp5OvRyxRQowuzRTD+vgVzA6QrEsYDi3PC6S4laFls9YjRb1zKP6mZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKwPzUGZ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD22606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD22606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKwPzUGZ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so9658975e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992442; x=1795597242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jqxyrzbxVSXD607utnRg/dtiDVgdF2PcAOp0S72RBFQ=;
        b=zKwPzUGZYmdddYPdPMlo97JJvnFLGwWmfOZ2NpMlLSl2+n8Auivewm5aGXoLjURAxQ
         I1heZ3JZhkSdFNxoDh31PW1FSzHrnBG9kyJMTMvuA1y057v5Ivks3AJuhHbR4WAtmy+y
         R4TKWqFzoRYIjwGeHJEjfTPM6cnkbk3rM/TUkbb6BDB4wl1dEx1VbnK8drtttqGrcGTk
         pGRWttYEMGz8iS6TsKajCCkGuqVyCNriXWYVikyvuCEsYfaqNKHJP71fLUYIk89zRDIF
         nggT8+l2Mip1jNisBJLGRcLWc6arfR9T2WqN41GNM0FN4K8iVCU6hYQkxoBCeNE6zp9U
         ADpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992442; x=1795597242;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqxyrzbxVSXD607utnRg/dtiDVgdF2PcAOp0S72RBFQ=;
        b=aBCZQO+yS6N/0FJ/MDz5vFwnZF92B8cN9m9iIT2AI3JxuhxKLfNipZrEZluYUpB6x7
         nbZ4KI82fzC0sr6KrjE/ytTuQJgtBHO/Pg2K4EyQth51pF0stp0LlK4aclUnfgQ+tTs/
         hbY71yhu/C9LqVzy8dg89poYZ3vC+N/ujOqDDYbS/xeOPKIUG6B/5LLlIorvj+Dd2pNe
         PaNlzLUn7tnQN41OoUo6K2elEZFQdk8+9MfMw69QHOMlDy5zKHGkqpVmwBWXmhCafcr3
         FiIwjw3y3XGleFXTv8ZRkG7qyeUtx1CYWsLk+4y7/lXsLA3cl/4kKa+b2pZg+TVjdQms
         5G/g==
X-Forwarded-Encrypted: i=1; AL+hErF/9XCYPhBNDT1PWw6dKk1Ury+/fqZoAsgNUepJ+kf3CS9xHLe1uqkEMWDj9GWCnpgzBS4CIrUSG13RVrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cto176+LWlICJJwf3sTQnPVvmlSl6C+BUJ0MLSIbyhUDPoMg1
	v6rjakMrfNKxRrHDXWVnHJg5YIrR3VS8o5FFvNDTr+QaGwe26GuHRxw0
X-Gm-Gg: AYBFou1vQ4flIPo8yo7YDNzqVOt8R32zb+iDoiiZ1x7g+RcdcXYtKHNQzMylQqWm1yE
	AcWadFaxI6rQrbUGEZ9Vfwj+1fsHZM/sUD2vnoqj0v4QRzuwGg3mctPrrE1PP+CVan4zBJrD8ed
	Z0C+7vAX8LcuH7e1l4/G2Be4XNUvwXyMWmfyd17By6Ett8LPg8sutkXgo89Ggp1cwDHZpPhsmdT
	FTqO+VZDCDPMlFqQ5RQV+A1IJA+qFwiPHoqD7gHLJsj+MEBaywEpZEpIoy6FiDn9r+FWJVhBD0Y
	cSe3ByFUJk4G7JrOZU+w1GoIg764nkMuUNJyrmgba7sN8O44Vs3pvV/ZbCIXOef4N26TN3/sAwe
	b94yROI9GWagaOij8YIapu2qQObnMh5g4eq2yit1FoyO3MWT+G9Rn+2JJsAolfiPQkMk3v4aPe0
	JHAu/S5+1dkQBoY8xHzEIROWFuF1a/H2iipzdLDRddfyLwv/MokFpq5x/9Hsf36bbb8ZynMYxWt
	hHPalYsFYVWaJivVoCXGZiAHilPv2wklXlUwuaji0t9CDymuUWcGMCZ5fBQGc3yGoxT3jVZb/Fk
	nTxYTLi56tRNYtXYCOoKPUcO9TAF9lHX6XnO6lEuUUXnxy81sfrFgyNwarxoo5RQeA==
X-Received: by 2002:a05:600c:8904:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb7daa7fe1mr24609405e9.21.1794992439985;
        Wed, 18 Nov 2026 01:00:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm50470825e9.11.2026.11.18.01.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:00:36 -0800 (PST)
Date: Wed, 18 Nov 2026 09:00:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar
 <mingo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, "Borislav Petkov (AMD)" <bp@alien8.de>,
 stable@vger.kernel.org, x86@kernel.org
Subject: Re: [tip: x86/urgent] x86/build: Do not allow X86_NATIVE_CPU to be
 enabled when compile testing
Message-ID: <20261118090035.15ced20c@pumpkin>
In-Reply-To: <20261118072848.GA325225@ax162>
References: <179480914308.3191731.6125228756396043444.tip-bot2@tip-bot2>
	<avrPcQ4sOkgJPbkZ@gmail.com>
	<20261116130159.GA1327949@ax162>
	<CAHk-=wgmkoWHWwaQ6nsGoCiBp0hrpJuiwmoVbQ=Efun8JyUNKw@mail.gmail.com>
	<20261116223628.5a6139a7@pumpkin>
	<20261118072848.GA325225@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 00:28:48 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> On Mon, Nov 16, 2026 at 10:36:28PM +0000, David Laight wrote:
> > I don't even remember a check that the compiler is right for the architecture.
> > I'm sure I've got strange errors when I've forgotten I need to specify the
> > compiler for a cross build - and then forgotten where I'd put the compiler,  
> 
> Yeah, I guess having some internal check that the correct compiler is
> being used could be useful/user friendly but given how fast things
> explode otherwise, I am not sure it is worth the additional complexity.
> 
> > Oh and forgotten all the things you need to set to get clang to do a
> > cross compile.  
> 
>   $ make ARCH=... LLVM=1
> 
> is generally all you need to do nowadays.
> 

That requires that you also get the correct clang on $PATH.
I'm sure I remember that not being as easy as it might seem.

David
