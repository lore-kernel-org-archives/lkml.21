Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997171;
	b=AkQrO9aTGkKPrORmsYRs8qxY0R3gUO4O97y2FJ9XXmuU4Zgi4HO/x60A9+wDp3fzJksv
	 TBFMjjbyUkeZ6JrNiU1P0Q2HoA6/GSfRNt252lOOV4CM+7pMR1xev/4fRS1P+E5BQhRbt
	 mqVmzFy4iMJUpOCltnjrhfAz8Uz5ta5RX6gXfRSnfm2jJ2ed0enexYZ+BTwOOGuXOYtpC
	 6J42SHMxwDRtshlckgGZmT5K4oJJVsyHj/1FNQzVWnFQtyp6I4EYSD6fWIqReRA81R4z/
	 GltYtlQKZXreWsWGX8ObBKexm3fC8GWzUt8xtV0Dw+6pMHWgnHjb7qxmQpbwH5fi8eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NjR9C+m/zvTfHbg5SMxjrHHBlgzBe0tcW4KYDDXsSd4=;
	b=Gm6GxlGwLiKXGK25iZIve2PNnwal4W2laPoyW+BQRJY8vIBbUrF5pzLwZBEOvVkBqo5n
	 LXKY77ZPicRrXzqg2Nv4L5SZKhsKhll3cNJ9c+1F6Fjg0Cfd36jnFY54Vyuuh6Ay6gPkG
	 vCwkXsST2jJHV58SqOtsAlPH/oPb9iW5YqAX5TQKOZ7I8vMpQy4Ys0AECji3lakaCPrFV
	 RGtZNfHT+rTypHh+Oj22Q8QpGVj7h1kHHhM/yJv/e/EhJEtePhfydLbIIJ1YpOaUI/EfO
	 7x19HkC0Vg5G93zidmOcty7kZlCYExZBvJ+WtzjvGdLvDfCDCyJxyf9yEHQWbBPfSlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fpwZlnO9;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C5606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09C5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fpwZlnO9
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so637762a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794997170; x=1795601970; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjR9C+m/zvTfHbg5SMxjrHHBlgzBe0tcW4KYDDXsSd4=;
        b=fpwZlnO9jilQtLL4DAJCq7YOqNOZGys57uTa9iQ0e/cUCnxXIZPnpxhkYZQnDF/xVh
         7jQP4Fx3SpGgaxZ6nJMImICk4dfSLjcCl4Ve6eP0joRCfJN8eKX5iutyFFrH2rNkgLkr
         V/aWw9RRz7VWisDY+TUexJS9Di7UGVrdg+ELsm8vXQCviDj/SuMqROi+MWx74ynjHyCq
         ass1xoaurR7D/35+e1grHqtmcuI7Cb7N4Tu+fmgndjjm0RMnIJyJ+I1al4ilcgDrnjgq
         FDFu5KOfqfNAx1/jtsIztYwHwYSnSykqar/YutAR6DUR5OEzVBL3/os23ezQvFXxZkud
         Auww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997170; x=1795601970;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjR9C+m/zvTfHbg5SMxjrHHBlgzBe0tcW4KYDDXsSd4=;
        b=wOJ7617QZ3LqWTi0R1ZiMdjRYsmdEOf/cS2XjFHIMVa7s98yhFgCjS272ztBeXHZH8
         010dzD986uzOpTm5awOj8Tm1bEuQXXnksBTNxxTLI1MEeRG73OMUBK1nAmOko/h7XWmO
         uUGeu33XFVF2OAM87TPoKJhnob5Rx+P6BUd66Ac4fH83fHmYLncDtA5Y+LAi/4pPDbMk
         K8MIkTwPieCoRPdzV9KYwbmC0LBusFaYAwPa+SB3Nt1lnjA2klLeuegIi0gl3Ymy220J
         HLtpdyJcibIw7WOm97Qc9kK6cv7S64hb5n4M0WpkjpUzytt+ToBh+SDHYvxTZ6TGRQPd
         439g==
X-Forwarded-Encrypted: i=1; AL+hErEw8g+7NzzVi0qfXhmw9XaX7OMV+DBrVDtyg6L2RKgxGMLMczBcwQugqtTnZyNvKmqZL6peYY56PF0bSy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cMIZtMOr5e8W7RA4R9Se5vqxFS9XyMUTuGMXsS91qEdwUzf22
	fObjyiFRJ0WGfDVUQziiSwBwXt66hBL00OLcCgpIfYbW615V+eawQOUhCVdJ0LpbT6LMBnAypsW
	L3UHookRwT0A3q88JztBsemY3Vw==
X-Received: from pgbd17-n1.prod.google.com ([2002:a05:6a02:64d1:10b0:cdb:596a:2134])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6372:a748:b0:3dd:a197:735a with SMTP id adf61e73a8af0-3fe8adfdd60mr1941662637.51.1794997169891;
 Wed, 18 Nov 2026 02:19:29 -0800 (PST)
Date: Wed, 18 Nov 2026 10:19:12 +0000
In-Reply-To: <20261118101913.3135869-1-amitamishra@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118101913.3135869-1-amitamishra@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118101913.3135869-2-amitamishra@google.com>
Subject: [PATCH 1/2] dt-bindings: perf: arm,smmu-v3-pmcg: Allow power-domains
From: Amita Mishra <amitamishra@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	amitamishra@google.com
Content-Type: text/plain; charset="UTF-8"

On some SoCs, SMMUv3 Performance Monitor Counter Groups (PMCGs) reside
in switchable power domains rather than an always-on domain.

Document the optional power-domains property so that runtime power
management can manage the PMCG power state.

Signed-off-by: Amita Mishra <amitamishra@google.com>
---
 Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml b/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
index a4b53a6a1ebf..aea6623bb98c 100644
--- a/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
+++ b/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
@@ -36,6 +36,9 @@ properties:
 
   msi-parent: true
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.56.1.703.gf848ed807c-goog

