Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373677;
	b=Pl8A8OzXMkc+Ebh5wR3pv3H5IcK9SJc32C06/KA94ZSCRRWHdlTeak15J1v/7J23lMsc
	 gA6w3ChaDSbFkOiBvlBfkWn8pD6CRA7xU6fzSadMdIEHomhWsLdgzt/8C3xw2tgz9Orsg
	 Skk4GBc/C1uGLiR+QHu2LlVmJmoezLRrwieBNv0CVFnW65vPfRc3EV4xHmyy1p5r1jbCW
	 0I5bSiw1aTGgOvPYUIaVy25mB8c4bn9f9YWBQy0gQqlvBjTCNJ0H9FgY8QaIpsVillxN6
	 wrCa97B5zFzouxSQ6azjhojnTLTLSOUf7END3NrvmlYZVJl9p9UVxppWZJoUO/AeNPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Uf40K/pvodARX4TFG1e6YUSwIbzlkO0+M9Bn1ppfz2s=;
	b=3QtT22jxSAnQrR3p46NH7T3W5inItsjQdspsI47XTE8JI7zFo/pe1vrtFH+zsA4X+nyG
	 5bReOq1YEn1hWH0jIXx6U0N5tJSCg40nLsIHqZkSr0tkeoHwSgyhxCupmENdN2qM5PFId
	 P0dnM1g6pRSzHAWUXo3HzNK/NdTK63XrWRZV0rB7sSDCByqK+/Jnn5Ce6IPLCKzCPWjtT
	 yjwPVCyhIGVoOzf9AGZ4pAXqhGQ3nlldVSVBh3tAripAZGiRSrrH2ltmmFWw/dKa2zEa6
	 0VU/sA0zNl0ApB8WZwWm1RSXpVsZvn4yNkPAxQJcFoyWl4k5j5l5r0MnMirTyhSUIvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Iaef/p1i";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6AA606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6AA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iaef/p1i
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so526147a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795373676; x=1795978476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uf40K/pvodARX4TFG1e6YUSwIbzlkO0+M9Bn1ppfz2s=;
        b=Iaef/p1imBWOYDmFzHXqlV2pxfpBABeFA3v8p4Ao3xWCNO/2WMkjIK7UFKLAhGbkHQ
         POed4MhGLKUu+6WzHKcEYOMAiZGIVKDdsXbgRwFtg2SHdsDPHWxeyWalcdAD9kuW/EHa
         fLWSGH4J3uVWyTPAMWv1VATk9VdtjOeKAPfUKTV19sQ+Ksi88M6REDfSGrWMI2//5o3P
         aQCBEHFmcqwOjQAUvvpM/hm3+UIs1vrw6rkhSgjoHSbMyZ1O5mrJRs7D0VOj58zirupa
         iVsYC2JQTx5oJtocVzDklyBNANhQMYjhcFbv2lxkTH+D5wK5q02dgXjHcFavYOTM5zR9
         OOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373676; x=1795978476;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf40K/pvodARX4TFG1e6YUSwIbzlkO0+M9Bn1ppfz2s=;
        b=or8UU0nicifLGEdMvk5Il+wg3J81DfTKTilQgb8izMJel69QdGMHvyfU3d7D//Wr9V
         +YD7WIkJpeH0ZBVmuPCuumkECDCtKDII0XMSO49kGEhMSIQtJ1oHUiCt0iSk0cloDT6x
         fxI7KaHxgeOuZtPABmdPGmU1cH3vKsto0x56I+He2onXrGT58sQCUXq9Y/1jIiODl9Vj
         SjRRy7mboUh3cWCpYqkSlNK1XMtVkn+yFGcZtC7OJv1RWk/bZrItB2+eP1T6jHboH5yZ
         m19tONRDSq4j5eifT3k7qmEjpemb11Ij8GVY05pPr0IVRL0Sf+xkwH609978FDBxUWlK
         SUyw==
X-Forwarded-Encrypted: i=1; AL+hErHbc6O5liIdT1VDJUAXkx0a2TSSbKIV/hHwO0QR1UTvznQ4cpTsBNcBxfj9gx/tqk0dFK8N2JQdO+t/PMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z85iI4B9EoVGmJAiC87Sy1xSUPKcvt9GWjjit/JpTtDDr0PkQTm
	6HUj//BQ7do1RHyAVuRuh1URuiu9ipzyaJb5J7Xt8rMAp1slRv98YLHc
X-Gm-Gg: AZFdTZfCqIZM7IjMb5cPS3PypXzTzN+BD6hp9toB1WmqPEvU17cNOAA2gp1EQoxiCUp
	kv2LiLqVx2H51u5sRFHNJdSZXy7OpueVMlnV28MmkMxa2HQRHPPDDtyPtWOT0tNwciApxo8cTpO
	MBLOFCFF+zzEMA79FLJhRU9wVTJBsqtWJeKxN7keE0M/HgsDotwbXhbY6yBYEo0QIvu01nlty47
	FRsyZU1gZXwaT5EapKulhIBIZitE2rzeSxgQr05iM+EYKIyo7xDr7Nd0oZrOqSN9r2R5W6cVWcW
	yCTX5P3LmT13+D+ZtNyyx7e802EcpS4glFOo4qV/otw4xTRFJHf8ZdKnIK5sAKB+JohMMA8JkIS
	3R6mwFwpKeRa8nappVoVeeS8XsoZMNa+AVULNPm+ydaFbIFP5jgODFfjF33NAIboJZywkQSxVSi
	4cLrgYlbc0AM2bbW2Uv65QWVZi6oEMdYCKUx8XEqChsytVqdHg+Ke5Ru2iDocFxV2ICG5nGCGTP
	e+wxTfyqdz2Nv3UpyuUqWPjnMM5ojtdOCOcfvVJ+xLOyltlJtixnsZImr3L3FVoxyxHqtB+hiYa
	AnEqDdrKVyWOHrfoO10kWPfrOw==
X-Received: by 2002:a05:6402:22ed:b0:6b1:c285:f8d8 with SMTP id 4fb4d7f45d1cf-6ba1fb0ff8cmr5919856a12.11.1795373675341;
        Sun, 22 Nov 2026 10:54:35 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm2385762a12.36.2026.11.22.10.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:54:33 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] power: supply: s2mu005-battery: add S2MU106 (Samsung Galaxy XCover5)
Date: Sun, 22 Nov 2026 21:54:30 +0300
Message-ID: <20261122185429.557309-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DN05PYTW4NV6.SOA0NRNOJBAR@disroot.org>
References: <20261116074000.355176-1-tadilhusrev@gmail.com> <6afc2f77.2bb6edcb.1518d5.5d4f@mx.google.com> <DN05PYTW4NV6.SOA0NRNOJBAR@disroot.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 20 Nov 2026 21:22:14 +0530, Kaustabh Chakraborty wrote:
> Actually, this one was just fine. I didn't look at the patches
> meticulously but it seems like it does belong here. The correct approach
> would be to adjust the driver correctly so that it accepts both.
>
> The compatible patch is, in fact incorrect. The driver clearly uses two
> separate compatibles for the two devices, so there should not be any
> fallback.

Hi Kaustabh,

Thanks for taking a look. To be precise about what I was reacting to: the
unsoundness wasn't that the same driver matches two compatibles -- patch 3
did add a distinct match entry for each, with has_monout set correctly per
chip. It's that patch 1's binding declared the S2MU106 compatible as a
fallback to the S2MU005 one:

compatible = "samsung,s2mu106-fuel-gauge", "samsung,s2mu005-fuel-gauge";

That pattern exists so a kernel with no S2MU106-specific knowledge still
binds correctly via the old compatible alone. It doesn't hold here: a DT
node that lists only the old compatible (no S2MU106 string at all) still
matches s2mu005-battery.c's existing entry and takes the has_monout=true
path, reading MONOUT registers the S2MU106 doesn't have.

You're right that the actual fix is narrower than what I did: drop the
fallback from the binding (require samsung,s2mu106-fuel-gauge on its own),
keep extending s2mu005-battery.c as patches 2-3 did. I went further and
withdrew the whole series for a standalone driver, partly because I'd also
talked myself into a chip sharing three register offsets and their scaling
with another, on its own I2C address, not really belonging in that other
chip's device tree node/driver file. That's a shape preference more than a
bug fix, and I should have said so as a separate point rather than folding
it into the same withdrawal.

The standalone series (dt-bindings: power: supply: add
samsung,s2mu106-fuelgauge + power: supply: s2mu106-fuelgauge: add standalone
driver) is already out and hasn't had review yet. If you still think
reusing s2mu005-battery.c (minus the fallback) is the better shape, I'd
rather hear that case on that thread than have it settled by default --
I don't have a strong attachment either way beyond not wanting the MONOUT
bug back.

(Resent for the lists: my two earlier copies of this reply went out as
HTML and vger rejected both, so only you received them. Sorry for the
duplicate.)

Adil
