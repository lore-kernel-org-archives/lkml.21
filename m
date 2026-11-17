Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953702;
	b=xvAuOQew6UNJukdu3+SBppxQWWx9zlsRuEHoQWI9i2JZpf4QaIs6J8ArY7bebplYmNPA
	 tW9R5avjZSzNGaeLvlLkftRjuw29MYKR9dYkQY8cGFKkmBjmY/02Py+jO1wxg6YP6qvzK
	 9Mn5a353WVSmKZYHbSPvC2fQjlDBUaIvi+CJpJPGLPV1Bj+e1AKurLZ9nUeemhDZUg9IX
	 WbFQxdJZWzC2l6uN6MP3GKQyNONoqma8+9ZQuWJ9yDWCeaMHT6MEWyq3yIGXLaW2BATZX
	 PwNs58zxkavXUBh2pcowMojN8XdjNZsQLyoW8lUi/KbS6kGlz1zbpQ+xnSgLC0PP7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=AAv7hl5MrgB1vpOHPo0LiyBaHE4YcZ7pafpcrpMVxdk=;
	b=Eg/ebZGCos18HsviVbeuzeP9WoR7MPcyW6aNidWZ1R9n9yDCrh5Z19j2d3iZEQ/ovJS/
	 b5VYljYG6dcYpKdO3BY/cDyvfR529U84tTkq+7uXBzhh6GEYRDX+m/GPG2QxkWz7SuC3P
	 DOM4Vhn78xqiiSvC7oAKIrTD4nLADWvge2NYLbiyZ8qnyVbqmuhSLj7goPdDksg0PRjsg
	 N1pbJN4dH2b+5HEo6ow5Z8DOSQdoJe1/sWYW6fZVmWreLJM8Hc9ls5LyIc4R8m2Lv2v7j
	 CN/5DgNBaKKcwtxWMPfcExPXPSqDrNuro2yFwCyO2fI/foAtELbvNWb+ZTnJWiux65g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptOjFYU6;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E893606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E893606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptOjFYU6
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6d68de53053so253249eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953700; x=1795558500; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AAv7hl5MrgB1vpOHPo0LiyBaHE4YcZ7pafpcrpMVxdk=;
        b=ptOjFYU6l9FDcqT0zN8EWl/bUXX6gCNlEGOUzVDF7Fg6lk0a6kY3Eq4Ix6obStoBaz
         ZoZ8SOJ66lrCzYI3zgDnpa7gBY8cpoSfp8K8qoL9JamFnCrv8qQmEpOf6AsuAv/kx03g
         1a9YigG9SFPSTIfmTsxn7xReA1G4Bg/NmGmms3LYwXqZlo/y6QKQavr/HIf3gCn8D4Nx
         a/zFFxW6uksKuXS8pbOwhpAvXnvLwmWSq7g/VPBR2MOns9JlZ2IVKCpWsW7SyiXibRU6
         CM4HOky+YXR3yjYohk47p/+lqnXkrjU6b1OrsUzeCFA24VuoIC06+EIUYSmvw02vD9qY
         +6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953700; x=1795558500;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AAv7hl5MrgB1vpOHPo0LiyBaHE4YcZ7pafpcrpMVxdk=;
        b=AOLw2YeZxSrWmTH6mkufN3/cIUgvzIBs6qjmB+Hjd9ctg7T259DvfikwGJEc5artD+
         x7dojja2Jq3O4/qeVquFKPIfL7lDJwmiydZK6exhm81YfH1Mjh7nNsZNDHFaqaXD5mw1
         l+n3m9XViKipdUolLTRSg32Vna5BZGJiRc8AgUSFwHNhNkuoLm6FtGR9EFe/AstxHU/f
         n8EJObdRkLce5RZSuxHcvaFj4Ut0lU+sKDchNVfNLJcJ6SOKj5kTfjfZelMmZDfEEQFn
         NJ0jL4ZRuD0pOzvuvLxJna7d848R+oE0ebmJ8FI+Iw1o2/PzGzac31hKoqGSXqWWcagK
         zurA==
X-Gm-Message-State: APuU4Z8R5ybMLSHdMzmbRUI1qK/G5Nh4wFzDfef6JiZ/ePLYQyegaSyB
	bvYhEF5M3y5KgSvi32UlpxKlFCsqUrR258lhIxLJOg86vox5IFpVtJJj
X-Gm-Gg: AYBFou3EWR54B+E9vOjZZswrBuKBtkkFrWwTYfMHh2nAZPlC055YewtkYhLXEQKAsah
	n7g4IUnvGgd4w+oxm7JIOxAAXznxUd0wRZ7St2iq9+86nrXFVadHFzhvcFoQsCQuO+iDpaNZzA0
	Mf+//t0Zeip6dzI9S7bMVN6Rx1Y5aOcE+z/ER2tUJ2yNmHESle7W/CaJk2I3drFINzZSGNtmvu6
	HLNRCJ8nJCfJX0ewboKI0H1Ok58Ro6mxmznPUAzbucbjAfHZMqOB60uEbjHaRRbZWUlSbVbjbni
	OkfOspKdAcMQChBmmvZeCUcOK8+GWFkq2CPAaGlo/UeH31QQEvy7qHci2n0UJnmSxPrAy9dA7BO
	dKJzKqOqDmNgU86TgReFqmo0oKUGWRiDNXyS0In9i2Lye8KPuDT+bBcgOu339KBmhhUlJEFmZU8
	QQwxzCQqEPqdzBeW/qBqL0IezqtEHmgOntBLQkGIwnf2dPStGwVL8SuGkJYLIMmeQZIUxh5u9mK
	qCdeXFCiyPbtSYGXekDZ9hC2PM7QkI7OckQLsEbFIs27Y+5XgPi2bIGBTOhZRsju5fNGjx1NJtX
	8foH87Z7/Kw+WH61MQivFR3ZZ2Ewe++1aDmoPE7SI0FuEGScxI3fA7Gg4vYIUVU2bJQa+8zIkdQ
	2skCrYUyXhZTfP6ilZUgyFkfEWERtVf8ys+IhuAaLps9Kk6DI/E9TokN+/PrrynKXdTG5Dhnz+M
	3V7mtzLFABloUossPvnPbNZrWvnTOJ43+abtFZ6LtIrQwYDPxbhS46
X-Received: by 2002:a05:6820:858e:20b0:6f9:59ee:cf9a with SMTP id 006d021491bc7-71b1827bdd0mr450903eaf.7.1794953700241;
        Tue, 17 Nov 2026 14:15:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b19450af7sm459727eaf.4.2026.11.17.14.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:14:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:14:46 -0700
Subject: [PATCH] nvmem: core: validate DT cell bits before allocating the
 name
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-submit-nvmem-dt-cell-name-v1-v1-1-491cee782e6e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2OQQ6DMAwEv4JyrkmDWpD4SsUBEgNuSaBOQEiIv
 zdAjyPP7noTHpnQizLZBONCnkYXQd0SofvadQhkIovsnuVKqQL83FgK4BaLFkwAjcMArrYIiwJ
 8KqPaPC8exohYMTG2tJ71r+rimH+jDkfn32D8znE3XJpoao8QGLFM+hAmX0rZUUg/yA6HdOROT
 nMjvbZyIDev8jocjvRMjuT5Who5aUeGa7/a9x9XvjXn6wAAAA==
X-Change-ID: 20261117-submit-nvmem-dt-cell-name-v1-e51d1f6674dd
To: Srinivas Kandagatla <srini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

An invalid bits property makes nvmem_add_cells_from_dt() return before
it frees the cell name. Allocate the name after validating the property,
and fail before invoking the provider fixup if allocation fails.

Fixes: def3173d4f17 ("nvmem: core: Print error on wrong bits DT property")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-219531@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..56e04c030c7f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -819,7 +819,6 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 
 		info.offset = be32_to_cpup(addr++);
 		info.bytes = be32_to_cpup(addr);
-		info.name = kasprintf(GFP_KERNEL, "%pOFn", child);
 
 		addr = of_get_property(child, "bits", &len);
 		if (addr && len == (2 * sizeof(u32))) {
@@ -833,6 +832,9 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 			}
 		}
 
+		info.name = kasprintf(GFP_KERNEL, "%pOFn", child);
+		if (!info.name)
+			return -ENOMEM;
 		info.np = of_node_get(child);
 
 		if (nvmem->fixup_dt_cell_info)

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-fixes
change-id: 20261117-submit-nvmem-dt-cell-name-v1-e51d1f6674dd

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

